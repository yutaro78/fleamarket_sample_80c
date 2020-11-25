class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  # optional: trueは外部キーがnullであることを許可するオプション

  validates :post_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/, message: "は半角英数で入力する必要があります"}, presence: true
  validates :prefecture_id, presence: true
  validates :city, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/, message: "は全角で入力する必要があります" }, presence: true
  validates :house_number, presence: true
end
