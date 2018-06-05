class BusStopSerializer < ActiveModel::Serializer
  attributes def stop
    object.code
  end
end