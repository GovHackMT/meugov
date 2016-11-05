class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
        can :manage, :all
    elsif user.government?
        can [:read, :create, :update], Proposal
        can [:read, :create, :update], Comment
    elsif user.citizen?
        can [:read, :create, :update], Proposal
        can [:read, :create, :update], Comment
    else
        can :read, :all
    end
  end
end
