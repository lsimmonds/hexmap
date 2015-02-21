class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.references :map, index: true
      t.string :name
      t.text :description
      t.timestamps null: false
      t.userstamps 
    end
  end
end
