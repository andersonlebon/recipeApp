# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.role == "admin"?
        can :manage, :all
      else
        can :read, :all
        cannot :destroy, Inventory do |inventory|
          inventory.user_id != user.id
        end

        cannot :destroy, Recipe do |recipe|
        recipe.user_id != user.id

        can :create, Recipe do |recipe|
          recipe.public == true || recipe.user_id == user.id
      end
      end
    #
  
  end
end
