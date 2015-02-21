class AddDimensionToHex < ActiveRecord::Migration
  def change
    add_column :hexes, :x, :integer
    add_column :hexes, :y, :integer
  end
end
