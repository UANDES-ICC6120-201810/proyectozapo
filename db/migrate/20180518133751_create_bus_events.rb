class CreateBusEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_events do |t|
      t.references :bus, foreign_key: true
      t.references :bus_stop, foreign_key: true
      t.datetime :event_time
      t.decimal :bus_speed

      t.timestamps
    end
  end
end
