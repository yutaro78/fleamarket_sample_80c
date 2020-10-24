class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :images
  belongs_to :category
  belongs_to :user
  belongs_to_active_hash :size
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_days
end
