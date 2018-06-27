module API
  module V1
    class Base < Grape::API
      mount API::V1::Operators
      mount API::V1::Vehicles
      mount API::V1::BusStopServices
      mount API::V1::VehicleEvents
      mount API::V1::BusStops
      mount API::V1::BusStopCongestions
      mount API::V1::OccupationEventPeopleCounts
      mount API::V1::AddEstimationOfBuses
      mount API::V1::AddBusServices
      mount API::V1::AmountOfPassengers
      mount API::V1::Services
      mount API::V1::Info
      mount API::V1::BusEvents
      mount API::V1::AmountOfWaitingTimeQueries
    end
  end
end
