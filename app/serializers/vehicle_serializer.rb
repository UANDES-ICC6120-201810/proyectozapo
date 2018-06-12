
class VehicleSerializer < ActiveModel::Serializer
  attributes def plate_number
    object.plate_number
  end
end