class AccessGroupBusStopSerializer < ActiveModel::Serializer
  attributes def bus_stop
    BusStop.where(id: object.bus_stop_id).first.code
  end
end