
class BusSerializer < ActiveModel::Serializer
  attributes def bus_plate_number
    object.bus_plate_number
  end
end