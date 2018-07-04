module API
  module V1
    class AddBusServices < Grape::API
      include API::V1::Defaults
      #Auth
      before {access_point_logger}

      params do
        requires :results, type: JSON, desc: 'results'
        optional :bus_services, type: JSON
        optional :not_buses, type: JSON
        optional :captured_at, type: DateTime, desc: 'calculated time'
        optional :operator_id, type: Integer, desc: 'operator'
        optional :plate_number, type: String, desc: 'plate number'
        optional :route_code, type: String, desc: 'route'
      end

      resource :add_bus_services do
        desc "Looks in transantiago API the relationship between buses and operators and saves it"
        post "", root: :add_bus_services do
          { 'declared_params' => declared(params) }
          results = params[:results]
          #add bus services
          results[:bus_services].each do |bus_service|
            begin
              add_bus_service(bus_service)
            rescue
              {'results': 'error'}
              break
            end
          end
          #add vehicles that are not buses
          results[:not_buses].each do |not_bus|
            begin
              add_not_bus(not_bus)
            rescue
              {'results': 'error'}
              break
            end
          end
          {'results': 'bus services added'}
        end
      end

      helpers do
        def add_bus_service(result)
          route_code = result[:route_code]
          plate_number = result[:plate_number]
          operator_number = result[:operator_number]
          service = Service.where(route_code: route_code).first
          bus = Vehicle.where(plate_number: plate_number).first
          operator = Operator.where(operator_number: operator_number).first
          if not service.present?
            Service.create!({route_code: route_code})
          end
          if not bus.present?
            Vehicle.create!({plate_number: plate_number, is_bus: true})
          else
            bus.update(is_bus: true)
          end
          if not operator.present?
            Operator.create!({operator_number: operator_number})
          end
          service = Service.where(route_code: route_code).first!
          bus = Vehicle.where(plate_number: plate_number).first!
          operator = Operator.where(operator_number: operator_number).first!
          bus_service = BusService.where(vehicle_id: bus.id).first
          if bus_service.present?
            bus_service.update({service_id: service.id,
                                 operator_id: operator.id ,
                                 captured_at: result[:captured_at]
                                })
          else
            BusService.create!({service_id: service.id,
                                vehicle_id: bus.id,
                                operator_id: operator.id,
                                captured_at: result[:captured_at]
                               })
          end
        end
        def add_not_bus(result)
          vehicle = Vehicle.where(plate_number: result)
          vehicle.update(is_bus: false)
        end
      end
    end
  end
end