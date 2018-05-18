class CreateOperators < ActiveRecord::Migration[5.2]
  def change
    create_table :operators do |t|
      t.string :name
      t.string :operator_number

      t.timestamps
    end
  end
end
