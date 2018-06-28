json.extract! log, :id, :message, :type_of_log, :created_at, :updated_at
json.url log_url(log, format: :json)
