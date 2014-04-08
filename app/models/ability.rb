class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.id > 0
      can :manage, Shorter, :user_id=>user.id
      can :read, :all
    else
      can :read, :all
      can :create, Shorter
    end

  end
end
