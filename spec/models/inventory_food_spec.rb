require 'rails_helper'

# Test for Inventory_food model
RSpec.describe InventoryFood, type: :model do
  # Create a new inventory
  before(:each) do
    @user = User.new(name: 'Test User', email: 'exemple@gmail.com', password: 'password')
    @food = Food.new(name: 'Test Food', measurement_unit: 'kilo', price: 100, user: @user)
    @inventory = Inventory.new(name: 'Test Inventory', user: @user)
    @inventory_food = InventoryFood.new(food: @food, quantity: 10, inventory: @inventory)
    end

    # should belong to user
    it 'belongs to a user' do
        expect(@inventory_food.food_id).to eq(@user.id)
    end

    # should belong to inventory
    it 'belongs to an inventory' do
        expect(@inventory_food.inventory).to eq(@inventory)
    end

    # should belong to food
    it 'belongs to a food' do
        expect(@inventory_food.food).to eq(@food)
    end

    # should have a quantity
    it 'has a quantity' do
        expect(@inventory_food.quantity).to eq(10)
    end
end