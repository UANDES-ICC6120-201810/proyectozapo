class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.text :message

      t.timestamps
    end
  end
end
