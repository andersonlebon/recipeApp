class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can :manage, Inventory, user_id: user.id
      can :manage, InventoryFood, user_id: user.id
      
      cannot :destroy, Recipe do |recipe|
        recipe.user_id != user.id
      end

      can :read, Recipe do |recipe|
        recipe.public == true || recipe.user_id == user.id
      end
    end
  end
end
