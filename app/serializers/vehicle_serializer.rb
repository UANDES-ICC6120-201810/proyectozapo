
class VehicleSerializer < ActiveModel::Serializer
  attributes def bus_plate_number
    object.plate_number
  end
end