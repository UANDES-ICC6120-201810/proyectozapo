class AddVehiclesToBusStopServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :bus_stop_services, :vehicle, foreign_key: true
  end
end
