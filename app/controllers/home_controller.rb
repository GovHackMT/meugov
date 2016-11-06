class HomeController < ApplicationController
  def index
    @proposals = Proposal.avaliable
    @popular_proposals = Proposal.avaliable.popular

    @government_proposals = Proposal.avaliable.government
    @society_proposals = Proposal.avaliable.society
  end
end
