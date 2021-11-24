class InventoryFoodsController < ApplicationController
  def new
    @inventory_food = InventoryFood.new
    @foods = current_user.foods
  end

  def create
    @foods = current_user.foods
    inventory_food = InventoryFood.new(inventory_food_params)
    inventory_food.inventory_id = params[:inventory_id]

    if inventory_food.save
      redirect_to user_inventory_path(current_user.id, params[:inventory_id]), notice: 'Inventory food added succesfully'
    else
      redirect_to new_user_inventory_inventory_food_path(current_user.id, params[:inventory_id]), alert: 'Duplicate entry. Please choose another food'
      
    end
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy

    redirect_to user_inventory_path(params[:user_id], params[:inventory_id]), alert: 'Inventory food deleted succesfully'
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id) 
  end
end
