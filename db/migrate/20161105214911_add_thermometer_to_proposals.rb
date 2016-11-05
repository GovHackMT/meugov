class AddThermometerToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :thermometer, :float
  end
end
