class FoodsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      flash[:success] = 'Food was successfully created.'
      redirect_to foods_path
    else
      flash[:error] = 'Error: Failed to add new food!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id])

    if @food.destroy!
      flash[:success] = 'Food deleted!'
      redirect_to foods_path
    else
      flash[:error] = 'Failed to delete food!'
    end
  end

  private

  def food_params
    food = params.require(:food).permit(:name, :measurement_unit, :unit_price)
    food[:user_id] = current_user.id
    food
  end
end
