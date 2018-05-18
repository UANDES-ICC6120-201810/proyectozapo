class BusService < ApplicationRecord
  belongs_to :service
  belongs_to :bus
  belongs_to :operator
end
