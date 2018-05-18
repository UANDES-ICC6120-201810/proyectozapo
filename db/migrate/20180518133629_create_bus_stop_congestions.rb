class CreateBusStopCongestions < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_stop_congestions do |t|
      t.references :bus_stop, foreign_key: true
      t.datetime :event_time
      t.decimal :amount_of_people
      t.string :image_url

      t.timestamps
    end
  end
end
