require 'rails_helper'

# Test for inventory model
RSpec.describe Inventory, type: :model do
  # Create a new inventory
  before(:each) do
    @user = User.new(name: 'Test User', email: 'exemple@gmail.com', password: 'password')
    @inventory = Inventory.new(name: 'Test Inventory', user: @user)
  end

  # should belong to user
  it 'belongs to a user' do
    expect(@inventory.user).to eq(@user)
  end

  # should have a name
  it 'has a name' do
    expect(@inventory.name).to eq('Test Inventory')
  end

  # should have many  inventory_foods\
  it 'has many inventory_foods' do
    expect(@inventory).to respond_to(:inventory_foods)
  end
end
