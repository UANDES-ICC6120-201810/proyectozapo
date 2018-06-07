class AddDetailsToBusStopCongestions < ActiveRecord::Migration[5.2]
  def change
    add_column :bus_stop_congestions, :image_endpoint_source, :string
    add_column :bus_stop_congestions, :image_bucket_source, :string
    add_column :bus_stop_congestions, :image_name, :string
  end
end
