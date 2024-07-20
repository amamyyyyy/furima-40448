class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      Payjp.api_key = "sk_test_97ef9b9af9002e7560c9e603"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price, # 商品の価格
        card: buy_params[:token], # カードトークン
        currency: 'jpy' # 通貨の種類（日本円）
      )
      @buy_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:code, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end
end
