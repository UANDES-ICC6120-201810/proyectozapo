module API
  module V1
    class BusStopServices < Grape::API
      include API::V1::Defaults
      #Auth
      before {access_point_logger}

      resource :estimation_of_buses do
        desc "Buses estimated waiting time"
        params do
          requires :route_code, type: String, desc: "Service code"
        end
        get ":route_code", root: :bus_stop_services do
          busStopId = @current_access_point.bus_stop_id
          service = Service.where(route_code: permitted_params[:route_code]).first
          if not service.present?
            add_log(BusStop.find(busStopId).code + "/" + permitted_params[:route_code], 'failed waiting time query')
            {'results': 'error in route code'}
          else
            estimation = BusStopService.where(bus_stop_id: busStopId, service_id: service.id, active: true)
            if estimation.present?
              add_log(BusStop.find(busStopId).code + "/" + permitted_params[:route_code], 'waiting time query')
              estimation
            else
              add_log(BusStop.find(busStopId).code + "/" + permitted_params[:route_code], 'not authorized waiting time query')
              {'results': 'error, the route code does not belong to this bus stop'}
            end
          end
        end
      end
    end
  end
end
