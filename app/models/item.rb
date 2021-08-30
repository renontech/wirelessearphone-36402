class Item < ApplicationRecord
  has_many :reviews
  with_options presence: true do
    validates :name
    validates :maker
    validates :image
    with_options numericality: {only_integer: true} do
      validates :price
    end
  end
  has_one_attached :image

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
end
