class CreateBusStops < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_stops do |t|
      t.string :code
      t.string :name
      t.decimal :stop_lat
      t.decimal :stop_lon

      t.timestamps
    end
  end
end
