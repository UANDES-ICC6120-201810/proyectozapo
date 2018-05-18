class CreateBusStopServices < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_stop_services do |t|
      t.references :bus_stop, foreign_key: true
      t.string :service_references
      t.string :last_arrival_estimation
      t.datetime :captured_at

      t.timestamps
    end
  end
end
