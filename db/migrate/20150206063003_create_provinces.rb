class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.references :country, index: true
      t.references :map, index: true
      t.string :name
      t.text :description
      t.timestamps null: false
      t.userstamps 
    end
  end
end
