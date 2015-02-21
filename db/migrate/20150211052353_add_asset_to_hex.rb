class AddAssetToHex < ActiveRecord::Migration
  def change
    add_column :hexes, :image, :string
    add_column :hexes, :background, :string
    add_column :hexes, :overlay, :string
  end
end
