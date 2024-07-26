class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  

  def index
    if @item.buy.present? 
      redirect_to root_path
    end
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:code, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price, # 商品の価格
        card: buy_params[:token], # カードトークン
        currency: 'jpy' # 通貨の種類（日本円）
      )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user # もし出品者が商品の所有者なら
      redirect_to root_path # トップページにリダイレクト
    end
  end
end
