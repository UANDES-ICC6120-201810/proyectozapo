class CreateAccessPointDispositives < ActiveRecord::Migration[5.2]
  def change
    create_table :access_point_dispositives do |t|
      t.references :dispositive, foreign_key: true
      t.references :access_point, foreign_key: true

      t.timestamps
    end
  end
end
