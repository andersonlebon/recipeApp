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
  
private

def inventory_params
  params.require(:inventory).permit(:name, :description) 
end
end
