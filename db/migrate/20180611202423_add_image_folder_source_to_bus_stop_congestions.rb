class AddImageFolderSourceToBusStopCongestions < ActiveRecord::Migration[5.2]
  def change
    add_column :bus_stop_congestions, :image_folder_source, :string
  end
end
