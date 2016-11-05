class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.references :state, index: true, foreign_key: true
      t.string :name
      t.integer :population
      t.decimal :pib

      t.timestamps null: false
    end
  end
end
