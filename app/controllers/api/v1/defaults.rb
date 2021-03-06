module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        prefix "api"
        version "v1", using: :path
        default_format :json
        format :json
        formatter :json, Grape::Formatter::ActiveModelSerializers

        helpers do
          def permitted_params
            @permitted_params ||= declared(params, include_missing: false)
          end

          def access_point_logger
            begin
              current_access_point = AuthorizeApiRequest.new(headers).access_point_call[:access_point]
            rescue
              ExceptionHandler
              error!('Not Authorized', 401)
            end
            @current_access_point = current_access_point
          end

          def user_client_logger
            begin
              user_client = AuthorizeApiRequest.new(headers).user_client_call[:user_client]
            rescue
              ExceptionHandler
              error!('Not Authorized', 401)
            end
            @current_user = user_client
          end

          def add_log(message, type_of_log)
            Log.create(:message => message,
                       :type_of_log => type_of_log,
                       :created_at => DateTime.now.strftime("%Y-%m-%d %H:%M:%S"),
                       :updated_at => DateTime.now.strftime("%Y-%m-%d %H:%M:%S"))
          end

          def logger
            Rails.logger
          end
        end

        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          error_response(message: e.message, status: 422)
        end
      end
    end
  end
end