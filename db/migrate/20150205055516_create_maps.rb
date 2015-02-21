class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.text :description
      t.timestamps null: false
      t.userstamps 
    end
  end
end
