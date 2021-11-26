class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all

      can :edit, Recipe, user: user
      can :update, Recipe, user: user
      can :manage, Recipe, user: user

      can :manage, Inventory, user_id: user.id
      can :manage, InventoryFood, user_id: user.id


      can :manage, Food, user: user
    end
  end
end
