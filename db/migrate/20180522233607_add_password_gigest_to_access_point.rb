class AddPasswordGigestToAccessPoint < ActiveRecord::Migration[5.2]
  def change
    add_column :access_points, :password_digest, :string
  end
end
