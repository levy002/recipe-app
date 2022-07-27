class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_recipe
  has_many :foods, through: :food_recipe
end
