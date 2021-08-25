class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :price
    validates :maker
  end
  has_one_attached :image
end
