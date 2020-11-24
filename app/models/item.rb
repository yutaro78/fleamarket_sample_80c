class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  belongs_to :user
  belongs_to_active_hash :size
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :condition

  validates :name,             presence: true, length:{maximum: 40 }
  validates :introduction,     presence: true, length: {maximum: 1000 }
  validates :price,            presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :images,           presence: true
  validates :condition_id,     presence: true
  validates :prefecture_id,    presence: true
  validates :shipping_cost_id, presence: true
  validates :shipping_days_id, presence: true
  # validates :category_id,      presende: true
  # validates :user_id,          presence: true

end
