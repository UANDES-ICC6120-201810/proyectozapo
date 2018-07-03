json.extract! bus_event, :id, :vehicle_id, :bus_stop_id, :event_time, :bus_speed, :created_at, :updated_at
json.url bus_event_url(bus_event, format: :json)
