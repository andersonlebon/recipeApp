require 'rails_helper'

# Test for Recipe model
RSpec.describe Recipe, type: :model do
  # Create a new recipe
  before(:each) do
    @user = User.new(name: 'Test User', email: 'exemple@gmail.com', password: 'password')
    @recipe = Recipe.new(name: 'Test Recipe', user: @user)
   
    end

    # should belong to user
    it 'belongs to a user' do
        expect(@recipe.user).to eq(@user)
        end
    # should have a name    
    it 'has a name' do
        expect(@recipe.name).to eq('Test Recipe')
        end 

    # should have many recipe_foods
    it 'has many recipe_foods' do
         # # has many recipe_foods
        @food = Food.new(name: 'Test Food', measurement_unit: 'kilo', price: 100, user: @user)
        @recipe_food = RecipeFood.new(recipe: @recipe, food: @food)
        @recipe.recipe_foods << @recipe_food    
        expect(@recipe.recipe_foods).to eq([@recipe_food])
        end
end