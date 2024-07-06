require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it "nameとdescription、priceが存在するかつcategory_id、condition_id、shopping_fee_id、prefecture_id、shopping_day_idの値が１以外だったら登録できる" do
        expect(@item).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空では登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300円以下では登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが9,999,999円以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceに半角数字以外が含まれている場合は登録できない' do
        @item.price = '1000０'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "category_idが空では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "condition_idが空では登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "shopping_fee_idが空では登録できない" do
        @item.shopping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee must be other than 1")
      end

      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "shopping_day_idが空では登録できない" do
        @item.shopping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping day must be other than 1")
      end

      it 'ユーザーが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
