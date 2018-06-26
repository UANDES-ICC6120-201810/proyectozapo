module API
  module V1
    class Info < Grape::API
      include API::V1::Defaults
      #Auth
      before {user_client_logger}
      resource :info do
        desc "Return info of endpoints"
        get "", root: :operators do
          {"API info": "http://proyectozapo.herokuapp.com/info/api_info"}
        end
      end
    end
  end
end