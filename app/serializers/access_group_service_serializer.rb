class AccessGroupServiceSerializer < ActiveModel::Serializer
  attributes def id
    object.id
  end,
      def code
        Service.find(object.service_id).route_code
      end
end