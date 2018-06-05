class AddServicesToBusStopServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :bus_stop_services, :service, foreign_key: true
  end
end
