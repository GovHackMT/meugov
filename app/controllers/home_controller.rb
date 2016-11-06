class HomeController < ApplicationController
  def index
    @proposals = Proposal.avaliable
    @popular_proposals = Proposal.avaliable.popular.limit(6)

    @government_proposals = Proposal.avaliable.government
    @society_proposals = Proposal.avaliable.society
  end
end
