module API
  module V1
    class AmountOfWaitingTimeQueries < Grape::API
      include API::V1::Defaults
      #Auth
      before {user_client_logger}
      resource :amount_of_waiting_time_queries do
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
          waiting_time_logs =["failed waiting time query","waiting time query","not authorized waiting time query"]
          if correct_bus_stops
            if correct_dates
              if correct_order
                logs_index = []
                logs = Log.where("type_of_log IN (?) AND updated_at <= ? AND updated_at >= ?", waiting_time_logs, end_date, start_date)
                if correct_bus
                  logs.each do |log|
                    message = log.message.split('/')
                    if bus_stops.include?(BusStop.where(code: message[0]).first.id) and bus.code == message[1]
                      logs_index << log.id
                    end
                  end
                  Log.where("id in (?)", logs_index)
                elsif not params[:correct_bus].present?
                  logs.each do |log|
                    message = log.message.split('/')
                    if bus_stops.include?(BusStop.where(code: message[0]).first.id)
                      logs_index << log.id
                    end
                  end
                  Log.where("id in (?)", logs_index)
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