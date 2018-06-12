module API
  module V1
    class Vehicles < Grape::API
      include API::V1::Defaults
      #Auth
      before {access_point_logger}
      resource :unverified_vehicles do
        desc "Returns unverified vehicles and buses"
        get "", root: :vehicles do
          Vehicle.where(is_bus: nil).or(Vehicle.where(is_bus: true))
        end
      end
    end
  end
end