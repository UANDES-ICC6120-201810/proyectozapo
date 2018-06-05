module API
  module V1
    class BusStopCongestions < Grape::API
      include API::V1::Defaults
      #Auth
      before {access_point_logger}

      params do
        requires :source_endpoint, type: String
        requires :source_bucket, type: String
        requires :source_filename, type: String
        #requires :occupation_event_id, type: Integer
        #requires :people_count, type: Integer
      end

      resource :occupation_event do
        desc "Information captured in the control point of the congestion"
        post "", root: :bus_stop_congestions do
          { 'declared_params' => declared(params) }
          bus_stop_congestion = BusStopCongestion.new(image_endpoint_source: permitted_params[:source_endpoint],
                                                      image_bucket_source: permitted_params[:source_bucket],
                                                      image_name: permitted_params[:source_filename],
                                                      bus_stop_id: @current_access_point.bus_stop_id)
          bus_stop_congestion.save
          {'results': 'event added'}
        end
      end
    end
  end
end
