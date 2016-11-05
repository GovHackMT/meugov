class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :property_category, index: true
      t.string :name
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :cep
      t.references :city, index: true
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
