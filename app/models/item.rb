class Item < ApplicationRecord
  has_many :reviews
  has_one_attached :image
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
  
  with_options presence: true do
    validates :maker
    validates :image
    with_options uniqueness: true do
      validates :name
    end
    with_options numericality: {only_integer: true} do
      validates :price
    end
  end

  def avg_score
    unless self.reviews.empty?
      reviews.average(:point).round(1)
    else
      0.0
    end
  end

  def avg_score_percentage
    unless self.reviews.empty?
      reviews.average(:point).round(1).to_f*100/5
    else
      0.0
    end
  end

  def reviews_number
    unless self.reviews.empty?
      reviews.length
    else
      0
    end
  end

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.order('created_at DESC').includes(:reviews)
    end
  end

end
