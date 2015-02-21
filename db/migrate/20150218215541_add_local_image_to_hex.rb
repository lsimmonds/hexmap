class AddLocalImageToHex < ActiveRecord::Migration
  def change
    add_column :hexes, :local_image, :string
  end
end
