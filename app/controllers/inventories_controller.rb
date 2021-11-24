class InventoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @inventories = Inventory.all
  end



  

end
