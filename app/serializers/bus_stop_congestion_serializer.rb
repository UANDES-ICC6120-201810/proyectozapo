class BusStopCongestionSerializer < ActiveModel::Serializer
  attributes def date
    object.event_time.strftime("%Y-%m-%d %H:%M:%S")
  end,
      def amount
        object.amount_of_people
      end
end