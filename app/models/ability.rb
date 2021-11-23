class Ability
  include CanCan::Ability
  def initialize(user)
    return unless user.present?

    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :manage, :all
    end
  end
end