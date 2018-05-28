module API
  module V1
    class BusStopServices < Grape::API
      include API::V1::Defaults
      #Auth
      before {access_point_logger}

      resource :estimation_of_buses do
        desc "Buses estimated waiting time"
        get "", root: :bus_stop_services do
          busStopId = @current_access_point.bus_stop_id
          BusStopService.where(bus_stop_id: busStopId)
        end
      end
    end
  end
end
