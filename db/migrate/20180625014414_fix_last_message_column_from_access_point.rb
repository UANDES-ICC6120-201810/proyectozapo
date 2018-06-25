class FixLastMessageColumnFromAccessPoint < ActiveRecord::Migration[5.2]
  def change
    rename_column :access_points, :last_message, :last_connection
  end
end
