class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
  VALID_PASSWPRD_REGEX = /\A[a-z0-9]+\z/
  validates :password, format: { with: VALID_PASSWPRD_REGEX, message: "は半角英数字で入力してください" }, presence: true
  validates :firstname, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/, message: "は全角で入力してください" }, presence: true
  validates :lastname, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/, message: "は全角で入力してください" }, presence: true
  validates :firstname_kana, format: { with: /\A([ァ-ン]|ー)+\z/, message: "は全角で入力してください" }, presence: true
  validates :lastname_kana, format: { with: /\A([ァ-ン]|ー)+\z/, message: "は全角で入力してください" }, presence: true
  validates :birth, presence: true
  validates :nickname,  presence: true

  has_one :address

  has_many :comments
  has_many :order
  has_one :pay
  has_many :items
end
