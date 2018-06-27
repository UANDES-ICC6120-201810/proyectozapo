class LogSerializer < ActiveModel::Serializer
  attributes def bus_stop
    message = object.message.split("/")
    message[0]
  end,
      def route_code
        message = object.message.split("/")
        message[1]
      end,
      def type
        object.type_of_log
      end,
      def event_time
        object.updated_at.strftime("%Y-%m-%d %H:%M:%S")
      end
end