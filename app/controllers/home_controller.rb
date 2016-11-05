class HomeController < ApplicationController
  def index
    @proposals = Proposal.associations.open
    @popular_proposals = Proposal.associations.open.popular
  end
end
