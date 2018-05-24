class RemoveFilePackageIdFromFileToUpdate < ActiveRecord::Migration[5.2]
  def change
    remove_column :file_to_updates, :file_package_id, :integer
  end
end
