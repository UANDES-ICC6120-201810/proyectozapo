class BusEvent < ApplicationRecord
  belongs_to :vehicle
  belongs_to :bus_stop
end
