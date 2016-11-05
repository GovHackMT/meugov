class AddStreetAndNumberAndComplementAndNeighborhoodAndCepAndCityToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :street, :string
    add_column :proposals, :number, :string
    add_column :proposals, :complement, :string
    add_column :proposals, :neighborhood, :string
    add_column :proposals, :cep, :string
    add_reference :proposals, :city, index: true
  end
end
