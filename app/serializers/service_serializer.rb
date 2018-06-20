class ServiceSerializer < ActiveModel::Serializer
  attributes def id
    object.id
  end,
      def code
        object.route_code
      end
end