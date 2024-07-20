require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
  end
  describe '購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'codeが空だと保存できないこと' do
        @buy_address.code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Code can't be blank")
      end
      it 'codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_address.code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @buy_address.prefecture_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @buy_address.street = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @buy_address.phone_number = '０９０１２３４５６７８'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number は半角数字で入力してください')
      end
      it '購入者記録が紐付いていないと保存できないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it '購入品記録が紐付いていないと保存できないこと' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
