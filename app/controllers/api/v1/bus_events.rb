module API
  module V1
    class BusEvents < Grape::API
      include API::V1::Defaults
      #Auth
      before {access_point_logger}

      params do
        requires :plate_number, type: String
        requires :speed, type: String
        requires :event_time, type: DateTime
      end

      resource :vehicle_event do
        desc "Information captured in the control point of a vehicle"
        post "", root: :bus_events do
          { 'declared_params' => declared(params) }
          plate_number = permitted_params[:plate_number]
          vehicle = Vehicle.where(plate_number: plate_number).first!
          if vehicle.present? and vehicle[:is_bus]
            create_bus_event(vehicle)
            {'results': 'event added'}
          else
            {'results': 'error'}
          end
        end
      end
      helpers do
        def create_bus_event(vehicle)
          @bus_event = BusEvent.new(vehicle_id: vehicle[:id],
                                    bus_stop_id: @current_access_point.bus_stop_id,
                                    event_time: permitted_params[:event_time],
                                    bus_speed: permitted_params[:speed])
          @bus_event.save
        end
      end
    end
  end
end


