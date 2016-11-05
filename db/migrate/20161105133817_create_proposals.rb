class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
