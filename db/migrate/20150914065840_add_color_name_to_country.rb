class AddColorNameToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :color_name, :string
  end
end
