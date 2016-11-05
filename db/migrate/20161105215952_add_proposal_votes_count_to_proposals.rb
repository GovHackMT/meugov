class AddProposalVotesCountToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :proposal_votes_count, :integer, default: 0
  end
end
