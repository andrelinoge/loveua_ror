class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :manage, :all if user.admin?
    can :read, Profile

    if user.user?
        can [:edit, :update], [User, Profile]
    end
  end
end