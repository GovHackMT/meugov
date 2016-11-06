class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
        can :manage, :all
    elsif user.government? or user.citizen?
        can :manage, Proposal
        can :manage, Comment
        can :manage, ProposalVote
    else
        can :read, :all
    end
  end
end
