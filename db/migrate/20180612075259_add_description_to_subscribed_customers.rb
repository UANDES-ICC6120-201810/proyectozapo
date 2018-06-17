class AddDescriptionToSubscribedCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribed_customers, :description, :string
  end
end
