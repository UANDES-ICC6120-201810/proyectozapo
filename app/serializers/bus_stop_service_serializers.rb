class BusStopServiceSerializer < ActiveModel::Serializer
  attributes def route
    Service.find(object.service_id).route_code

  end,
      def waiting_time
        object.last_arrival_estimation
      end
end