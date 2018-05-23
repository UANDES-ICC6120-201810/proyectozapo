class BusEventsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!, only: [:create]
  before_action :authorize_request

  # POST /Bus Events
  def create
    @bus_event = BusEvent.new
    @bus_event.bus_speed = bus_event_params[:bus_speed]

    @bus = Bus.find_by(bus_plate_number: bus_event_params[:plate_number])
    @bus_event.bus_id = @bus.id

    # TODO: check bus stop id by token
    @bus_event.bus_stop_id = 1
    @bus_event.save
    json_response(@bus_event, :created)
  end

  private

  def bus_event_params
    # whitelist params
    params.permit(:bus_speed, :plate_number)
  end
end
