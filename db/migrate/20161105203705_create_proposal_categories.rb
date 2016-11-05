class CreateProposalCategories < ActiveRecord::Migration
  def change
    create_table :proposal_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
