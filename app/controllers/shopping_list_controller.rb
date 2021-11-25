class ShoppingListController < ApplicationController
  def index
    @user=current_user
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])

    @recipe_foods = @recipe.recipe_foods
    @inventory_foods = @inventory.inventory_foods

    @rf = @recipe_foods.dup
    @list = @rf.map {|recipe_food| rfc = recipe_food.dup
      if @inventory_foods.select{|inv| inv.food_id==recipe_food.id}.size > 0 
        rfc.quantity -= @inventory_foods.select{|inv| inv.food_id==recipe_food.id}[0].quantity
      end
      rfc
    }

    @shopping_list = [];
    @list.each do |item|
      if item.quantity > 0
        @shopping_list.push({
          name: Food.find(item.food_id).name,
          measurement_unit: Food.find(item.food_id).measurement_unit,
          price: Food.find(item.food_id).price * item.quantity,
          quantity: item.quantity,
        })
      end
    end
  end
end
