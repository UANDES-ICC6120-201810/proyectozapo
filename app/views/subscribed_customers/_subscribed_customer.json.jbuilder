json.extract! subscribed_customer, :id, :access_group_id, :name, :description, :created_at, :updated_at
json.url subscribed_customer_url(subscribed_customer, format: :json)
