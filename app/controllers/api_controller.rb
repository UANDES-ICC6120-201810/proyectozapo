class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!, only: [:create_bus_event]

  # POST /Bus Events
  def create_bus_event
    @bus_event = BusEvent.new
    @bus_event.bus_speed = params[:bus_speed]

    @bus = Bus.find_by(bus_plate_number: params[:plate_number])
    @bus_event.bus_id = @bus.id

    # TODO: check bus stop id by token
    @bus_event.bus_stop_id = 1
    @bus_event.savepost
    json_response(@bus_event, :created)
  end

  private

  def bus_event_params
    # whitelist params
    params.permit(:bus_speed, :plate_number)
  end
end
