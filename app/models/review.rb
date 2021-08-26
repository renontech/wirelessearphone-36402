class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  with_options presence: true do
    validates :title
    validates :text
    with_options numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10, message: "can't be blank"} do
      validates :point
    end
  end
end
