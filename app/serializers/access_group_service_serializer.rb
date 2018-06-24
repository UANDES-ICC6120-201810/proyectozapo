class AccessGroupServiceSerializer < ActiveModel::Serializer
  attributes def route
        Service.find(object.service_id).route_code
      end
end