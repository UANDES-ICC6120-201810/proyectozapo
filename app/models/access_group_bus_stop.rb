class AccessGroupBusStop < ApplicationRecord
  belongs_to :access_group
  belongs_to :bus_stop
end
