class RemoveServiceIdFromBusStopServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :bus_stop_services, :service_id, :integer
  end
end
