class AddStatusToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :status, :integer, default: 0
  end
end
