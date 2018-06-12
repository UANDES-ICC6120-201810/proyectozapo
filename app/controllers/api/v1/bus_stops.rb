module API
  module V1
    class BusStops < Grape::API
      include API::V1::Defaults
      #Auth
      before {access_point_logger}
      resource :bus_stops do
        desc "All bus stops codes"
        get "", root: :bus_stops do
          BusStop.all
        end
      end
    end
  end
end