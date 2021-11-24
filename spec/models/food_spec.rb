require 'rails_helper'

# write ytest for food module
RSpec.describe Food, type: :model do
  # create a new food
  before(:each) do
    @user = User.new(name: 'Test User', email: 'exemple@gmail.com', password: 'password')
    @food = Food.new(name: 'Test Food', measurement_unit: 'kilo', price: 100, user: @user)

  end
    it 'is valid with a name' do
      expect(@food.name).to eq('Test Food')
    end

    # shoul belog to a user
    it 'belongs to a user' do
        expect(@food.user).to eq(@user)
        end
    # should have a price
    it 'has a price' do
        expect(@food.price).to eq(100)
        end
    # should have a measurement unit
    it 'has a measurement unit' do
        expect(@food.measurement_unit).to eq('kilo')
        end

end