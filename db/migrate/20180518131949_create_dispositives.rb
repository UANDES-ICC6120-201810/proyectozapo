class CreateDispositives < ActiveRecord::Migration[5.2]
  def change
    create_table :dispositives do |t|
      t.string :name
      t.string :type
      t.string :trademark
      t.string :model

      t.timestamps
    end
  end
end
