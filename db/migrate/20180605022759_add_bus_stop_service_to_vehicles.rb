class AddBusStopServiceToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_reference :vehicles, :bus_stop_service, foreign_key: true
  end
end
