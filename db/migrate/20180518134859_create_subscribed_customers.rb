class CreateSubscribedCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribed_customers do |t|
      t.references :access_group, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
