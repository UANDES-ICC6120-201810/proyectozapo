class BusService < ApplicationRecord
  belongs_to :service
  belongs_to :vehicle
  belongs_to :operator
end
