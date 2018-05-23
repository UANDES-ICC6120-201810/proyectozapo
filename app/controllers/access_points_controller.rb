class AccessPointsController < ApplicationController
  before_action :set_access_point, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session
  #skip_before_action :authorize_request, only: :sign_up
  skip_before_action :authenticate_user!, only: :sign_up

  # POST /signup
  # return authenticated token upon signup
  def sign_up
    access_point = AccessPoint.create!(access_point_params)
    auth_token = AuthenticateAccessPoint.new(access_point.ip, access_point.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  # GET /access_points
  # GET /access_points.json
  def index
    @access_points = AccessPoint.all
  end

  # GET /access_points/1
  # GET /access_points/1.json
  def show
  end

  # GET /access_points/new
  def new
    @access_point = AccessPoint.new
  end

  # GET /access_points/1/edit
  def edit
  end

  # POST /access_points
  # POST /access_points.json
  def create
    @access_point = AccessPoint.new(access_point_params)
    respond_to do |format|
      if @access_point.save
        format.html { redirect_to @access_point, notice: 'Access point was successfully created.' }
        format.json { render :show, status: :created, location: @access_point }
      else
        format.html { render :new }
        format.json { render json: @access_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /access_points/1
  # PATCH/PUT /access_points/1.json
  def update
    respond_to do |format|
      if @access_point.update(access_point_params)
        format.html { redirect_to @access_point, notice: 'Access point was successfully updated.' }
        format.json { render :show, status: :ok, location: @access_point }
      else
        format.html { render :edit }
        format.json { render json: @access_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /access_points/1
  # DELETE /access_points/1.json
  def destroy
    @access_point.destroy
    respond_to do |format|
      format.html { redirect_to access_points_url, notice: 'Access point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access_point
      @access_point = AccessPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def access_point_params
      #params.require(:access_point).permit(:bus_stop_id, :mac, :ip, :status, :token, :last_message, :password, :password_confirmation)
      params.permit(:bus_stop_id, :mac, :ip, :status, :token, :last_message, :password, :password_confirmation)
    end
end
