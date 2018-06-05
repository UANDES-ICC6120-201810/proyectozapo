module API
  module V1
    class BusEvents < Grape::API
      include API::V1::Defaults
      #Auth
      before {access_point_logger}

      resource :vehicle_event do
        desc "Information captured in the control point of a vehicle"
        post "", root: :vehicle_events do
          { 'declared_params' => declared(params) }
          plate_number = permitted_params[:plate_number]
          vehicle = Vehicle.where(plate_number: plate_number).first
          if not vehicle.present?
            Vehicle.create!({plate_number: plate_number, is_bus: false})
          end
          vehicle = Vehicle.where(plate_number: plate_number).first!
          begin
            BusEvent.create!({
                                 vehicle_id: vehicle[:id],
                                 bus_stop_id: @current_access_point.bus_stop_id,
                                 event_time: permitted_params[:event_time],
                                 bus_speed: permitted_params[:speed]
                             })
            {'results': 'event added'}
          rescue
            {'results': 'error'}
          end
        end
      end
    end
  end
end


