class CreateHexes < ActiveRecord::Migration
  def change
    create_table :hexes do |t|
      t.string :name
      t.text :description
      t.references :map, index: true
      t.references :country, index: true
      t.references :province, index: true
      t.timestamps null: false
      t.userstamps 
    end
  end
end
