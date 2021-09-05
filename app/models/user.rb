class User < ApplicationRecord
  has_many :reviews
  has_many :favorites
  has_many :favorite_items, through: :favorites, source: :item
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: {maximum: 12}
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  
end
