class RenameBusTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :buses, :bus_plate_number, :plate_number
    add_column :buses, :is_bus, :boolean
    rename_table :buses, :vehicles
  end
end
