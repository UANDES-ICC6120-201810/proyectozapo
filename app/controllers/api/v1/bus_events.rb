module API
  module V1
    class BusEvents < Grape::API
      include API::V1::Defaults
      #Auth
      before {user_client_logger}
      resource :bus_events do
        desc "Return the numbers of passengers in a bus stop"
        params do
          optional :bus, type: String
          requires :bus_stops, type: JSON
          requires :start, type: DateTime
          requires :end, type: DateTime
          optional :order_by, type: String
        end
        get "", root: :bus_events do
          { 'declared_params' => declared(params) }
          #Check params:
          #Check bus
          correct_bus = false
          access_group_services = AccessGroupService.where(access_group_id: @current_user.access_group_id)
          bus = Vehicle.where('plate_number = ? AND is_bus = ?', params[:bus], true).first
          if bus.present?
            bus_service = BusService.where(vehicle_id: bus.id).first!
            if bus_service.present?
              if access_group_services.where(service_id: bus_service.service_id).first!.present?
                correct_bus = true
              end
            end
          end
          #Check bus_stops
          correct_bus_stops = true
          access_group_bus_stop = AccessGroupBusStop.where(access_group_id: @current_user.access_group_id)
          bus_stops = []
          input_bus_stops = params[:bus_stops][:data]
          input_bus_stops.each do |bus_stop_code|
            bus_stop = BusStop.where(code: bus_stop_code).first
            if bus_stop.present?
              if access_group_bus_stop.where(bus_stop_id: bus_stop.id).present?
                bus_stops << bus_stop.id
              else
                correct_bus_stops = false
              end
            else
              correct_bus_stops = false
            end
          end
          #Check dates
          start_date = params[:start]
          end_date = params[:end]
          begin
            range = end_date - start_date
          rescue
            range = 0
          end
          correct_dates = range > 0 && range < 8
          #check order
          correct_order = false
          order_by = params[:order_by]
          if not order_by.present?
            order_by = "desc"
          end
          if order_by == "asc" or order_by == "desc"
            correct_order = true
          end
          #Show result
          if correct_bus_stops
            if correct_dates
              if correct_order
                if correct_bus
                  BusEvent.where("bus_stop_id IN (?) AND vehicle_id = ? AND event_time <= ? AND event_time >= ?", bus_stops, bus.id, end_date, start_date).order(:vehicle_id, event_time: order_by)
                elsif not params[:correct_bus].present?
                  BusEvent.where("bus_stop_id IN (?) AND event_time <= ? AND event_time >= ?", bus_stops, end_date, start_date).order(:bus_stop_id, event_time: order_by)
                else
                  {'error': "you don't have permission to see this bus or bus do not exist"}
                end
              else
                {'error': "order type doesn't exist"}
              end
            else
              {'error': "the dates are incorrect or the range is greater than allowed (one week)"}
            end
          else
            {'error': "you don't have permission to see these bus stops or bus stops do not exist"}
          end
        end
      end
    end
  end
end