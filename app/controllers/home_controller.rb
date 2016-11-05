class HomeController < ApplicationController
  def index
    @proposals = Proposal.associations.open
  end
end
