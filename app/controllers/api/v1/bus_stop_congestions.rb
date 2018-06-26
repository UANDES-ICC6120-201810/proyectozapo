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
        requires :source_folder, type: String
      end

      resource :occupation_event do
        desc "Information captured in the control point of the congestion"
        post "", root: :bus_stop_congestions do
          @current_access_point.last_connection = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
          @current_access_point.save
          { 'declared_params' => declared(params) }
          event_time = permitted_params[:source_filename][0..-5]
          event_time = DateTime.strptime(event_time, "%Y%m%d%H%M")
          bus_stop_congestion = BusStopCongestion.new(image_endpoint_source: permitted_params[:source_endpoint],
                                                      image_bucket_source: permitted_params[:source_bucket],
                                                      image_name: permitted_params[:source_filename],
                                                      image_folder_source: permitted_params[:source_folder],
                                                      bus_stop_id: @current_access_point.bus_stop_id,
                                                      event_time: event_time)
          bus_stop_congestion.save
          make_post_req(permitted_params[:source_endpoint], permitted_params[:source_bucket], permitted_params[:source_folder], permitted_params[:source_filename], bus_stop_congestion.id)
          {'results': 'event added'}
        end
      end
      helpers do
        def make_post_req(source_endpoint, source_bucket, source_folder, source_filename, bus_stop_congestion_id)
          require 'net/http'
          require 'json'
          begin
              uri = URI('http://165.227.75.0:8000/count_requests/')
              http = Net::HTTP.new(uri.host, uri.port)
              req = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
              req.body = {"source_endpoint" => source_endpoint, "source_bucket" => source_bucket,
                          "source_folder" => source_folder, "source_filename" => source_filename,
                          "bus_stop_congestion_id" => bus_stop_congestion_id}.to_json
              res = http.request(req)
              puts "response #{res.body}"
              puts JSON.parse(res.body)
          rescue => e
              puts "failed #{e}"
          end
        end
      end
    end
  end
end
