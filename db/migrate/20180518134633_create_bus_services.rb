class CreateBusServices < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_services do |t|
      t.references :service, foreign_key: true
      t.references :bus, foreign_key: true
      t.references :operator, foreign_key: true
      t.datetime :captured_at

      t.timestamps
    end
  end
end
