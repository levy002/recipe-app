class FoodRecipesController < ApplicationController
  before_action :set_food_recipe, only: %i[ show edit update destroy ]

  # GET /food_recipes or /food_recipes.json
  def index
    @food_recipes = FoodRecipe.all
  end

  # GET /food_recipes/1 or /food_recipes/1.json
  def show
  end

  # GET /food_recipes/new
  def new
    @food_recipe = FoodRecipe.new
    @recipe_id = params[:recipe_id]
  end

  # GET /food_recipes/1/edit
  def edit
    @recipe_id = params[:recipe_id]
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food_recipe = @recipe.food_recipe.create(food_recipe_params)
    if @recipe_food.save
      redirect_to recipe_path(params[:recipe_id]), flash: { alert: 'Your food is saved' }
    else
      redirect_to new_recipe_food_recipe_path, flash: { alert: 'Could not save your food' }
    end
  end

  def update
    respond_to do |format|
      if @food_recipe.update(food_recipe_params)
        format.html { redirect_to food_recipe_url(@food_recipe), notice: "Food recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @food_recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food_recipe = FoodRecipe.find(params[:id])
    @food_recipe.destroy!
    flash[:notice] = 'You have deleted the recipe food!'
    redirect_to recipe_path(params[:recipe_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_recipe
      @food_recipe = FoodRecipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_recipe_params
      params.require(:food_recipe).permit(:quantity, :recipe_id, :food_id)
    end
end
