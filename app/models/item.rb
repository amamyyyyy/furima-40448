class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_fee
  belongs_to :prefecture
  belongs_to :shopping_day
  belongs_to :user
  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shopping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :shopping_day_id, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
