module API
  module V1
    class Services < Grape::API
      include API::V1::Defaults
      #Auth
      before {user_client_logger}
      resource :services do
        desc "Returns a list with the codes of the services to which the current user can request information"
        get "", root: :amount_of_passengers do
          { 'declared_params' => declared(params) }
          AccessGroupService.includes(:service).where(access_group_id: @current_user.access_group_id)
        end
      end
    end
  end
end