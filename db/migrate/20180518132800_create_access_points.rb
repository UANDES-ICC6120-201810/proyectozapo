class CreateAccessPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :access_points do |t|
      t.references :bus_stop, foreign_key: true
      t.string :mac
      t.string :ip
      t.string :status
      t.string :token
      t.string :last_message

      t.timestamps
    end
  end
end
