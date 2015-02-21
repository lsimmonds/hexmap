class AddDimensionsToMap < ActiveRecord::Migration
  def change
    add_column :maps, :length, :integer
    add_column :maps, :width, :integer
  end
end
