class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWPRD_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password, format: { with: VALID_PASSWPRD_REGEX }
  validates :first_name, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }, presence: true
  validates :last_name, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }, presence: true
  validates :firstname_kana, format: { with: /\A([ァ-ン]|ー)+\z/ }, presence: true
  validates :lastname_kana, format: { with: /\A([ァ-ン]|ー)+\z/ }, presence: true
  validates :birth, presence: true
  validates :nickname,  presence: true
  
  has_one :address
end
