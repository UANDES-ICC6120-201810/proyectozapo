class BusEventsController < ApplicationController
  before_action :set_bus_event, only: [:show, :edit, :update, :destroy]

  # GET /bus_events
  # GET /bus_events.json
  def index
    @bus_events = BusEvent.all
    @bus_services = BusService.all
    @services = Service.all
  end

  # GET /bus_events/1
  # GET /bus_events/1.json
  def show
  end

  # GET /bus_events/new
  def new
    @bus_event = BusEvent.new
  end

  # GET /bus_events/1/edit
  def edit
  end

  # POST /bus_events
  # POST /bus_events.json
  def create
    @bus_event = BusEvent.new(bus_event_params)

    respond_to do |format|
      if @bus_event.save
        format.html { redirect_to @bus_event, notice: 'Bus event was successfully created.' }
        format.json { render :show, status: :created, location: @bus_event }
      else
        format.html { render :new }
        format.json { render json: @bus_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_events/1
  # PATCH/PUT /bus_events/1.json
  def update
    respond_to do |format|
      if @bus_event.update(bus_event_params)
        format.html { redirect_to @bus_event, notice: 'Bus event was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_event }
      else
        format.html { render :edit }
        format.json { render json: @bus_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_events/1
  # DELETE /bus_events/1.json
  def destroy
    @bus_event.destroy
    respond_to do |format|
      format.html { redirect_to bus_events_url, notice: 'Bus event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_event
      @bus_event = BusEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_event_params
      params.require(:bus_event).permit(:vehicle_id, :bus_stop_id, :event_time, :bus_speed)
    end
end
