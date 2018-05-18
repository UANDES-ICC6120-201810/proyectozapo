json.extract! file_to_update, :id, :file_package_id, :name, :file, :created_at, :updated_at
json.url file_to_update_url(file_to_update, format: :json)
