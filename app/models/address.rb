class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_code, :prefecture_code, :city, :house_number, :building_name, presence: true
end
