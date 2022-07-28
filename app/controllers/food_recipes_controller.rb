class FoodRecipesController < ApplicationController
  def index
    @food_recipes = FoodRecipe.all
  end

  def show; end

  def new
    @food_recipe = FoodRecipe.new
    @recipe_id = params[:recipe_id]
  end

  def edit
    @recipe_id = params[:recipe_id]
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    food_recipe = FoodRecipe.new(params.require(:recipe_food).permit(:food_id, :quantity))
    food_recipe.recipe = @recipe
    if food_recipe.save

      redirect_to recipe_path(params[:recipe_id]), flash: { notice: 'Your food is saved' }
    else
      redirect_to new_recipe_food_recipe_path, flash: { alert: 'Could not save your food' }
    end
  end

  def update
    @food_recipe = FoodRecipe.find(params[:id])
    @food_recipe.update(edit_food_recipe_params)
    flash[:notice] = 'You have updated the recipe food successfully'
    redirect_to recipe_path(params[:recipe_id])
  end

  def destroy
    @food_recipe = FoodRecipe.find(params[:id])
    recipe = @food_recipe.recipe
    @food_recipe.destroy!
    flash[:notice] = 'You have deleted the recipe food!'
    redirect_to recipe_path(recipe)
  end

  private

  def edit_food_recipe_params
    params.require(:edit_food_recipe).permit(:quantity, :food_id)
  end

  def food_recipe_params
    params.require(:food_recipe).permit(:quantity, :food_id)
  end
end
