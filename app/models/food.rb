class Food < ApplicationRecord
  belongs_to :user

  validates :measurement_unit, :unit_price, presence: true
  validates :unit_price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
