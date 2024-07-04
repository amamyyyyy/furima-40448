class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_fee
  belongs_to :prefecture
  belongs_to :shopping_day
  belongs_to :user
  has_one_attached :image
  validates :name, :description, :category_id, :condition_id, :shopping_fee_id, :prefecture_id, :shopping_day_id, :price, :image, presence: true
  validates :category_id, :condition_id, :shopping_fee_id, :prefecture_id, :shopping_day_id, numericality: { other_than: 1 }
  
end
