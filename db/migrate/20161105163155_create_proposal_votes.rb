class CreateProposalVotes < ActiveRecord::Migration
  def change
    create_table :proposal_votes do |t|
      t.references :proposal, index: true
      t.references :user, index: true
      t.integer :answer

      t.timestamps null: false
    end
  end
end
