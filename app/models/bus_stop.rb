class BusStop < ApplicationRecord
  validates :code, presence: true
end
