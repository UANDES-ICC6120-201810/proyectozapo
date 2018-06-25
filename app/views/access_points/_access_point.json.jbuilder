json.extract! access_point, :id, :bus_stop_id, :mac, :ip, :status, :token, :last_connection, :created_at, :updated_at
json.url access_point_url(access_point, format: :json)
