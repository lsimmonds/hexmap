class AddColorToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :color, :string
  end
end
