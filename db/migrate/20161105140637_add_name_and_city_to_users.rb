class AddNameAndCityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_reference :users, :city, index: true
  end
end
