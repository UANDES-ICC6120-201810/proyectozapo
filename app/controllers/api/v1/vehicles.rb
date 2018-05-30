module API
  module V1
    class Vehicles < Grape::API
      include API::V1::Defaults
      resource :buses do
        desc "Return all buses"
        get "", root: :vehicles do
          Vehicle.where(is_bus: true)
        end
      end
    end
  end
end