class CreateFileToUpdateFilePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :file_to_update_file_packages do |t|
      t.references :file_to_update, foreign_key: true
      t.references :file_package, foreign_key: true

      t.timestamps
    end
  end
end
