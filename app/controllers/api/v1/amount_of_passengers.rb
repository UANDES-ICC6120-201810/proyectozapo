module API
  module V1
    class AmountOfPassengers < Grape::API
      include API::V1::Defaults
      #Auth
      before {user_client_logger}
      resource :amount_of_passengers do
        desc "Return the numbers of passengers in a bus stop"
        params do
          requires :bus_stop, type: String
          requires :start, type: DateTime
          requires :end, type: DateTime
          optional :order_by, type: String
        end
        get "", root: :amount_of_passengers do
          { 'declared_params' => declared(params) }
          access_group_bus_stop = AccessGroupBusStop.where(access_group_id: @current_user.access_group_id)
          bus_stop = BusStop.where(code: params[:bus_stop]).first
          start_date = params[:start]
          end_date = params[:end]
          begin
            range = end_date - start_date
          rescue
            range = 0
          end
          if bus_stop.present? && range > 0 && range < 8 && access_group_bus_stop.present?
            if access_group_bus_stop.exists?(bus_stop_id: bus_stop.id)
              result = BusStopCongestion.where('bus_stop_id = ?  AND event_time >= ? AND event_time <= ?',
                                               bus_stop.id ,
                                               start_date,
                                               end_date)
              if params[:order_by].present?
                case params[:order_by]
                when "desc"
                  result = result.order(event_time: :desc)
                  result
                when "asc"
                  result = result.order(:event_time)
                  result
                else
                  {'error': "order type doesn't exist"}
                end
              else
                result
              end
            else
              {'error': "you don't have permission to see this bus stop"}
            end
          else
            {'error': "bus stop doesn't exist or the dates are incorrect or the range is greater than allowed (one week)"}
          end
        end
      end
    end
  end
end