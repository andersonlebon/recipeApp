class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @foods = current_user.foods.all
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
      redirect_to @Food
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
