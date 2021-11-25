# rubocop:disable Metrics/MethodLength
class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipe_foods = Recipe.find(params[:recipe_id]).recipe_foods
    @inventory_foods = Inventory.find(params[:inventory_id]).inventory_foods
    @rf = @recipe_foods.dup
    @list = @rf.map do |recipe_food|
      rfc = recipe_food.dup
      if @inventory_foods.select { |inv| inv.food_id == recipe_food.id }.size.positive?
        rfc.quantity -= @inventory_foods.select do |inv|
                          inv.food_id == recipe_food.id
                        end [0].quantity
      end
      rfc
    end
    @shopping_list = []
    @list.each do |item|
      next unless item.quantity.positive?

      @shopping_list.push({ name: Food.find(item.food_id).name,
                            measurement_unit: Food.find(item.food_id).measurement_unit,
                            price: Food.find(item.food_id).price * item.quantity,
                            quantity: item.quantity })
    end
  end
  # rubocop:enable Metrics/MethodLength
end
