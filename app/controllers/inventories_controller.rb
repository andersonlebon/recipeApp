class InventoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @inventories = Inventory.all
  end

  def new
    @inventory = Inventory.new  
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user = current_user

    if @inventory.save
      redirect_to user_inventories_path, notice: 'Inventory added succesfully'
    else
      render :new
    end
  end

  def show
    @inventory = Inventory.find(params[:id])
    @inventory_foods = @inventory.inventory_foods
    @arr = @inventory_foods.map { |inv_food| inv_food.food_id }
    @foods = current_user.foods.joins(:inventory_foods).where(id: @arr).uniq
  end
  

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy

    redirect_to user_inventories_path, alert: 'Inventory deleted succesfully'
  end
  
private

def inventory_params
  params.require(:inventory).permit(:name, :description) 
end
end
