class AddTokenToSubscribedCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribed_customers, :token, :string
  end
end
