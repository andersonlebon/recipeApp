class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      cannot :destroy, Inventory do |inventory|
        inventory.user_id != user.id
      end
      can :edit, Recipe, user: user
      can :update, Recipe, user: user
      can :manage, Recipe, user: user

      can :manage, Food, user: user
    end
  end
end
