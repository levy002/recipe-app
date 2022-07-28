class GeneralShoppingListController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @ingredients = FoodRecipe.where(recipe_id: @recipes.map(&:id))
    @foods = Food.where(id: @ingredients.map(&:food_id))
  end
end
