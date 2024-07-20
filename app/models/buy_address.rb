class BuyAddress
  include ActiveModel::Model
  attr_accessor :code, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city, :street, :user_id, :item_id, :token
    validates :phone_number, format: { with: /\A\d+\z/, message: 'は半角数字で入力してください' }
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(code: code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, buy_id: buy.id)
  end
end