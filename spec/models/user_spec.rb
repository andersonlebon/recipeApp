# frozen_string_literal: true

require 'rails_helper'
# write test for all User modul methods
RSpec.describe User, type: :model do
  # create a new user
  before(:each) do
    @user = User.new(name: 'Test User', email: 'exemple@gmail.com', password: 'password')
  end
  it 'is valid with a name' do
    expect(@user.name).to eq('Test User')
  end
  it 'is not valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end
  it 'is not valid an invalid email' do
    @user.email = 'a' * 51
    expect(@user).to_not be_valid
  end
  it 'is not valid without a password less than 6 characters' do
    @user.password = 'a' * 5
    expect(@user).to_not be_valid
  
  end
  it 'is valid with a name, an email, and a password' do
    expect(@user).to be_valid
  end
end
# EOF
#
