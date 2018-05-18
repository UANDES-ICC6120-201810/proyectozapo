module API
  module V1
    class Buses < Grape::API
      include API::V1::Defaults
      resource :buses do
        desc "Return all buses"
        get "", root: :buses do
          Bus.all
        end
      end
    end
  end
end