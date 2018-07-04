module API
  module V1
    class VehicleEvents < Grape::API
      include API::V1::Defaults
      #Auth
      before {access_point_logger}

      params do
        requires :plate_number, type: String
        requires :speed, type: BigDecimal
        requires :event_time, type: DateTime
      end

      resource :vehicle_event do
        desc "Information captured in the control point of a vehicle"
        post "", root: :vehicle_events do
          @current_access_point.last_connection = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
          @current_access_point.save
          { 'declared_params' => declared(params) }
          plate_number = permitted_params[:plate_number]
          position = plate_number.enum_for(:scan, /[A-Z]\d/).map { Regexp.last_match.begin(0) }
          if (position[0] > 0)
            plate_number.insert(position[0] + 1, '-')
          end
          vehicle = Vehicle.where(plate_number: plate_number).first
          if not vehicle.present?
            Vehicle.create!({plate_number: plate_number})
          end
          vehicle = Vehicle.where(plate_number: plate_number).first!
          if (BusEvent.where(vehicle_id: vehicle[:id],bus_stop_id: @current_access_point.bus_stop_id, event_time: permitted_params[:event_time]).present?)
            {'results': 'event added'}
          else
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
end
