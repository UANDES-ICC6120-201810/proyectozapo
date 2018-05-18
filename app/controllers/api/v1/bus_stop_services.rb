module API
  module V1
    class BusStopServices < Grape::API
      include API::V1::Defaults
      resource :bus_stop_services do
        desc "Buses estimated waiting time"
        params do
          requires :token, type: String, desc: "Token of the Point"
        end
        get ":token", root: "bus_stop_services" do
          accessPoint = AccessPoint.where(token: permitted_params[:token]).first!
          if (accessPoint.present?)
            busStopId = accessPoint.bus_stop_id
            BusStopService.where(bus_stop_id: busStopId).first!
          end
        end
      end
    end
  end
end