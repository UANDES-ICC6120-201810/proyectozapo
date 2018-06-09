module API
  module V1
    class OccupationEventPeopleCounts < Grape::API
      include API::V1::Defaults
      #Auth
      before {access_point_logger}

      params do
        requires :occupation_event_id, type: Integer
        requires :people_count, type: Integer
      end

      resource :occupation_event_people_count do
        desc "Information captured in the control point of the congestion"
        post "", root: :bus_stop_congestions do
          params do
            requires :occupation_event_id, type: Integer
            requires :people_count, type: Integer
          end
          { 'declared_params' => declared(params) }
          puts (permitted_params[:occupation_event_id])
          BusStopCongestion.update(permitted_params[:occupation_event_id], :amount_of_people => permitted_params[:people_count])
          {'results': 'Success'}
        end
      end
    end
  end
end
