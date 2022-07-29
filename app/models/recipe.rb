class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_recipes, dependent: :destroy
  has_many :foods, through: :food_recipes

  validates :name, presence: true, length: { in: 1..50 }
  validates :preparation_time, presence: true, length: { in: 1..100 }
  validates :cooking_time, presence: true, length: { in: 1..100 }
  validates :description, presence: true, length: { in: 1..300 }
end
