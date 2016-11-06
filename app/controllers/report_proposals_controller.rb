class ReportProposalsController < ApplicationController
  def index
  end

  def result
    @proposals = Proposal.report(params)
  end
end
