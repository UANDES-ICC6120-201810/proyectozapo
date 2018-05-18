class CreateAccessGroupServices < ActiveRecord::Migration[5.2]
  def change
    create_table :access_group_services do |t|
      t.references :access_group, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
