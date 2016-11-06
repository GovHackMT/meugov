class HomeController < ApplicationController
  def index
    @proposals = Proposal.avaliable
    @popular_proposals = Proposal.avaliable.popular.limit(6)

    @government_proposals = Proposal.avaliable.government.limit(10)
    @society_proposals = Proposal.avaliable.society.limit(10)
  end
end
