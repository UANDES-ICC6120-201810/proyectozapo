class FixVehicleReferences < ActiveRecord::Migration[5.2]
  def change
    rename_column :bus_events, :bus_id, :vehicle_id
    rename_column :bus_services, :bus_id, :vehicle_id
    remove_column :bus_stop_services, :service_references
    add_column :bus_stop_services, :service_id, :integer, references: :services
  end
end
