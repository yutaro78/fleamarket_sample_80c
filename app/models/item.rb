class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order,dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, update_only: true, reject_if: :no_image
  belongs_to :category
  belongs_to :user
  belongs_to_active_hash :size
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :condition

  validates :name,             presence: true, length: { maximum: 40 }
  validates :introduction,     presence: true, length: { maximum: 1000 }
  validates :price,            presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "を¥300〜¥9,999,999の間で入力してください" }
  validates :images,           presence: true
  validates :condition_id,     presence: true
  validates :prefecture_id,    presence: true
  validates :shipping_cost_id, presence: true
  validates :shipping_days_id, presence: true

  def no_image(image_attributes)
    image_attributes[:url].blank?
  end

end
