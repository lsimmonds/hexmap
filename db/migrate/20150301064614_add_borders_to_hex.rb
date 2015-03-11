class AddBordersToHex < ActiveRecord::Migration
  def change
    add_column :hexes, :c_border, :boolean, :default => false
    add_column :hexes, :p_border, :boolean, :default => false
  end
end
