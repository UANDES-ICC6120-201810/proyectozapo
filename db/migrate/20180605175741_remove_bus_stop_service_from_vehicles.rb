class RemoveBusStopServiceFromVehicles < ActiveRecord::Migration[5.2]
  def change
    remove_reference :vehicles, :bus_stop_service, foreign_key: true
  end
end
