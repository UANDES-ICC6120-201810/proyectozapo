module API
  module V1
    class AddEstimationOfBuses < Grape::API
      include API::V1::Defaults
      #Auth
      before {access_point_logger}

      params do
        requires :results, type: JSON, desc: 'results'
        optional :captured_at, type: DateTime, desc: 'calculated time'
        optional :last_arrival_estimation, type: String, desc: 'estimation'
        optional :route_code, type: String, desc: 'route'
        optional :bus_stop_code, type: String, desc: 'bus stop'
        optional :plate_number, type: String, desc: 'plate number'
      end

      resource :add_estimation_of_buses do
        desc "Buses estimate captured in transantiago API"
        post "", root: :add_estimation_of_buses do
          { 'declared_params' => declared(params) }
          params[:results].each do |result|
            begin
              add_estimation(result)
            rescue
              {'results': 'error'}
              break
            end
          end
          bus_stops = BusStopService.select(:bus_stop_id).map(&:bus_stop_id).uniq
          bus_stops.each do |bus_stop|
            last_capture = BusStopService.where(bus_stop_id: bus_stop).maximum('captured_at')
            BusStopService.where('bus_stop_id = ?  AND captured_at < ?', bus_stop ,last_capture).update_all(active: false)
          end
          {'results': 'estimation added'}
        end
      end

      helpers do
        def add_estimation(result)
          route_code = result[:route_code]
          plate_number = result[:plate_number]
          service = Service.where(route_code: route_code).first
          bus = Vehicle.where(plate_number: plate_number).first
          bus_code = result[:bus_stop_code]
          bus_stop = BusStop.where(code: bus_code).first!
          if not service.present?
            Service.create!({route_code: route_code})
          end
          if not bus.present?
            Vehicle.create!({plate_number: plate_number, is_bus: true})
          end
          service = Service.where(route_code: route_code).first!
          bus = Vehicle.where(plate_number: plate_number).first!
          BusStopService.create!({bus_stop_id: bus_stop.id,
                                  service_id: service.id,
                                  vehicle_id: bus.id,
                                  last_arrival_estimation: result[:last_arrival_estimation],
                                  captured_at: result[:captured_at],
                                  active: true
                                 })
        end
      end
    end
  end
end