class BusStopCongestionsController < ApplicationController
  before_action :set_bus_stop_congestion, only: [:show, :edit, :update, :destroy]

  # GET /bus_stop_congestions
  # GET /bus_stop_congestions.json
  def index
    @bus_stop_congestions = BusStopCongestion.all
  end

  # GET /bus_stop_congestions/1
  # GET /bus_stop_congestions/1.json
  def show
  end

  # GET /bus_stop_congestions/new
  def new
    @bus_stop_congestion = BusStopCongestion.new
  end

  # GET /bus_stop_congestions/1/edit
  def edit
  end

  # POST /bus_stop_congestions
  # POST /bus_stop_congestions.json
  def create
    @bus_stop_congestion = BusStopCongestion.new(bus_stop_congestion_params)
    @bus_stop_congestion.event_time = DateTime.parse(bus_stop_congestion_params[:event_time])
    respond_to do |format|
      if @bus_stop_congestion.save
        format.html { redirect_to @bus_stop_congestion, notice: 'Bus stop congestion was successfully created.' }
        format.json { render :show, status: :created, location: @bus_stop_congestion }
      else
        format.html { render :new }
        format.json { render json: @bus_stop_congestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_stop_congestions/1
  # PATCH/PUT /bus_stop_congestions/1.json
  def update
    @bus_stop_congestion.event_time = DateTime.parse(bus_stop_congestion_params[:event_time])
    respond_to do |format|
      if @bus_stop_congestion.update(bus_stop_congestion_params)
        format.html { redirect_to @bus_stop_congestion, notice: 'Bus stop congestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_stop_congestion }
      else
        format.html { render :edit }
        format.json { render json: @bus_stop_congestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_stop_congestions/1
  # DELETE /bus_stop_congestions/1.json
  def destroy
    @bus_stop_congestion.destroy
    respond_to do |format|
      format.html { redirect_to bus_stop_congestions_url, notice: 'Bus stop congestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_stop_congestion
      @bus_stop_congestion = BusStopCongestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_stop_congestion_params
      params.require(:bus_stop_congestion).permit(:bus_stop_id, :event_time, :amount_of_people)
    end
end
