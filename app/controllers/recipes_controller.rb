class RecipesController < ApplicationController
  load_and_authorize_resource
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @new_recipe = current_user.recipes.new(recipe_params)
    if @new_recipe.save!
      redirect_to recipes_path, flash: { alert: 'Your recipe is saved' }
    else
      redirect_to new_recipe_path, flash: { alert: 'Could not save your recipe' }
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    flash[:notice] = 'You have deleted the recipe!'
    redirect_to recipes_path
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.public
      @recipe.update(public: false)
      flash[:notice] = 'You have update the recipe status to private'
    else
      @recipe.update(public: true)
      flash[:notice] = 'You have update the recipe status to public'
    end
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
