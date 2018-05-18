class CreateAccessPointFilePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :access_point_file_packages do |t|
      t.references :access_point, foreign_key: true
      t.references :file_package, foreign_key: true
      t.datetime :sent
      t.datetime :installed

      t.timestamps
    end
  end
end
