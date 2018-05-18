class CreateAccessGroupBusStops < ActiveRecord::Migration[5.2]
  def change
    create_table :access_group_bus_stops do |t|
      t.references :access_group, foreign_key: true
      t.references :bus_stop, foreign_key: true

      t.timestamps
    end
  end
end
