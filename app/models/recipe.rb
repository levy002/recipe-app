class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_recipes, dependent: :destroy
  has_many :foods, through: :food_recipes
end
