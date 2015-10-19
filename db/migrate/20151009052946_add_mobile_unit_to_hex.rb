class AddMobileUnitToHex < ActiveRecord::Migration
  def change
    add_column :hexes, :mobile_unit, :string
  end
end
