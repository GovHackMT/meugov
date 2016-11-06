class AddCountViewsToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :count_views, :integer, default: 0
  end
end
