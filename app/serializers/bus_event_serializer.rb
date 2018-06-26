class BusEventSerializer < ActiveModel::Serializer
  attributes def bus_stop
    BusStop.find(object.bus_stop_id).code
  end,
      def plate_number
        Vehicle.find(object.vehicle_id).plate_number
      end,
      def route_code
        bus_service = BusService.where(vehicle_id: object.vehicle_id).first
        if bus_service.present?
          Service.find(bus_service.service_id).route_code
        end
      end,
      def event_time
        object.event_time
      end,
      def bus_speed
        object.bus_speed
      end
end