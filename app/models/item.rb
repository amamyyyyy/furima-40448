class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_fee
  belongs_to :prefecture
  belongs_to :shopping_day
  belongs_to :user
  has_one_attached :image
  has_one :buy
  with_options presence: true do
    validates :name, :description, :price, :image
    validates :category_id, :condition_id, :shopping_fee_id, :prefecture_id, :shopping_day_id
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :shopping_fee_id, :prefecture_id, :shopping_day_id
  end
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
