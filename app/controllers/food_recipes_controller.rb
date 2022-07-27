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
  end

  # GET /food_recipes/1/edit
  def edit
  end

  # POST /food_recipes or /food_recipes.json
  def create
    @food_recipe = FoodRecipe.new(food_recipe_params)

    respond_to do |format|
      if @food_recipe.save
        format.html { redirect_to food_recipe_url(@food_recipe), notice: "Food recipe was successfully created." }
        format.json { render :show, status: :created, location: @food_recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_recipes/1 or /food_recipes/1.json
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
    @food_recipe.destroy

    respond_to do |format|
      format.html { redirect_to food_recipes_url, notice: "Food recipe was successfully destroyed." }
      format.json { head :no_content }
    end
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
