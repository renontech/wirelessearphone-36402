class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :maker
    validates :image
    with_options numericality: {only_integer: true} do
      validates :price
    end
  end
  has_one_attached :image
end
