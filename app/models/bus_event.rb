class BusEvent < ApplicationRecord
  belongs_to :bus
  belongs_to :bus_stop
end
