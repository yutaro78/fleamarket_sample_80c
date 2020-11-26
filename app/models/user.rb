class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
  VALID_PASSWPRD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
  validates :password, format: { with: VALID_PASSWPRD_REGEX, message: "は半角7文字以上英大文字・小文字・数字それぞれ１文字以上含む必要があります" }, presence: true
  validates :firstname, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/, message: "は全角で入力する必要があります"}, presence: true
  validates :lastname, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/, message: "は全角で入力する必要があります" }, presence: true
  validates :firstname_kana, format: { with: /\A([ァ-ン]|ー)+\z/, message: "は全角カナで入力する必要があります" }, presence: true
  validates :lastname_kana, format: { with: /\A([ァ-ン]|ー)+\z/, message: "は全角カナで入力する必要があります" }, presence: true
  validates :birth, presence: true
  validates :nickname,  presence: true

  has_one :address

  has_many :pays
end
