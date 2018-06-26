class BusStopsController < ApplicationController
  before_action :set_bus_stop, :set_access_group_bus_stop, :set_access_point, only: [:show, :edit, :update, :destroy]

  # GET /bus_stops
  # GET /bus_stops.json
  def index
    @bus_stops = BusStop.all
  end

  # GET /bus_stops/1
  # GET /bus_stops/1.json
  def show
  end

  # GET /bus_stops/new
  def new
    @bus_stop = BusStop.new
  end

  # GET /bus_stops/1/edit
  def edit
  end

  # POST /bus_stops
  # POST /bus_stops.json
  def create
    @bus_stop = BusStop.new(bus_stop_params)

    respond_to do |format|
      if @bus_stop.save
        format.html { redirect_to @bus_stop, notice: 'Bus stop was successfully created.' }
        format.json { render :show, status: :created, location: @bus_stop }
      else
        format.html { render :new }
        format.json { render json: @bus_stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_stops/1
  # PATCH/PUT /bus_stops/1.json
  def update
    respond_to do |format|
      if @bus_stop.update(bus_stop_params)
        format.html { redirect_to @bus_stop, notice: 'Bus stop was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_stop }
      else
        format.html { render :edit }
        format.json { render json: @bus_stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_stops/1
  # DELETE /bus_stops/1.json
  def destroy
    accessPoint = @access_point.where(bus_stop_id: params[:id])
    accessGroupBusStop = @access_group_bus_stop.where(bus_stop_id: params[:id])
    accessGroupBusStop.each do |busStop|
      busStop.destroy
    end
    accessPoint.each do |access_point|
      access_point.destroy
    end
    @bus_stop.destroy
    respond_to do |format|
      format.html { redirect_to bus_stops_url, notice: 'Bus stop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_stop
      @bus_stop = BusStop.find(params[:id])
    end

    def set_access_group_bus_stop
      @access_group_bus_stop = AccessGroupBusStop.all
    end

    def set_access_point
      @access_point = AccessPoint.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_stop_params
      params.require(:bus_stop).permit(:code, :name, :stop_lat, :stop_lon)
    end
end
