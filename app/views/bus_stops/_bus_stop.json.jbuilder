json.extract! bus_stop, :id, :code, :name, :stop_lat, :stop_lon, :created_at, :updated_at
json.url bus_stop_url(bus_stop, format: :json)
