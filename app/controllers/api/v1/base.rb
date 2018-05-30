# ------------- Aqui se definen las rutas de los endpoints activos de la version 1 -------------
module API
  module V1
    class Base < Grape::API
      mount API::V1::Operators
      mount API::V1::Vehicles
      mount API::V1::BusStopServices
      mount API::V1::BusEvents
      # mount API::V1::AnotherResource
    end
  end
end