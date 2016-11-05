class AddProposalCategoryToProposals < ActiveRecord::Migration
  def change
    add_reference :proposals, :proposal_category, index: true
  end
end
