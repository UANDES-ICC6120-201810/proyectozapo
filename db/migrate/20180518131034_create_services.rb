class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :route_code

      t.timestamps
    end
  end
end
