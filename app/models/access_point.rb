class AccessPoint < ApplicationRecord
  belongs_to :bus_stop

  # encrypt password
  #has_secure_password
end
