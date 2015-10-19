class AddColorToProvince < ActiveRecord::Migration
  def change
    add_column :provinces, :color, :string
    add_column :provinces, :color_name, :string
  end
end
