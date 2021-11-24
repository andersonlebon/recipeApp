require 'rails_helper'

# Test for RecipeFood model
RSpec.describe RecipeFood, type: :model do
  # Create a new recipe
  before(:each) do
    @user = User.new(name: 'Test User', email: 'exemple@gmail.com', password: 'password')
    @recipe = Recipe.new(name: 'Test Recipe', user: @user)
    @recipe_food = RecipeFood.new(recipe: @recipe, food: Food.new(name: 'Test Food', user: @user), quantity: 10)
    end

    # should belong to user
    it 'belongs to a user' do
        expect(@recipe_food.recipe_id).to eq(@user.id)
        end
    # should belong to recipe
    it 'belongs to a recipe' do
        expect(@recipe_food.recipe).to eq(@recipe)
        end
    # should belong to food 
    it 'belongs to a food' do
        expect(@recipe_food.food).to eq(@recipe_food.food)
        end
    # should have a quantity
    it 'has a quantity' do
        expect(@recipe_food.quantity).to eq(10)
        end
end
