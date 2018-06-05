class AddActiveToBusStopServices < ActiveRecord::Migration[5.2]
  def change
    add_column :bus_stop_services, :active, :boolean
  end
end
