class HomeController < ApplicationController
  def index
    @proposals = Proposal.associations.open
    @popular_proposals = Proposal.associations.open.popular

    @government_proposals = Proposal.associations.open.government
    @society_proposals = Proposal.associations.open.society
  end
end
