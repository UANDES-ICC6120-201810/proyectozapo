class AccessGroupsController < ApplicationController
  before_action :set_access_group, :set_access_group_bus_stop, :set_access_group_service, :set_subscribed_customer, only: [:show, :edit, :update, :destroy]

  # GET /access_groups
  # GET /access_groups.json
  def index
    @access_groups = AccessGroup.all
  end

  # GET /access_groups/1
  # GET /access_groups/1.json
  def show
  end

  # GET /access_groups/new
  def new
    @access_group = AccessGroup.new
  end

  # GET /access_groups/1/edit
  def edit
  end

  # POST /access_groups
  # POST /access_groups.json
  def create
    @access_group = AccessGroup.new(access_group_params)
    respond_to do |format|
      if @access_group.save
        format.html { redirect_to @access_group, notice: 'Access group was successfully created.' }
        format.json { render :show, status: :created, location: @access_group }
      else
        format.html { render :new }
        format.json { render json: @access_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /access_groups/1
  # PATCH/PUT /access_groups/1.json
  def update
    respond_to do |format|
      if @access_group.update(access_group_params)
        format.html { redirect_to @access_group, notice: 'Access group was successfully updated.' }
        format.json { render :show, status: :ok, location: @access_group }
      else
        format.html { render :edit }
        format.json { render json: @access_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /access_groups/1
  # DELETE /access_groups/1.json
  def destroy
    accessGroupBusStop = @access_group_bus_stop.where(access_group_id: params[:id])
    accessGroupService = @access_group_service.where(access_group_id: params[:id])
    subscribedCustomer = @subscribed_customer.where(access_group_id: params[:id])
    accessGroupBusStop.each do |busStop|
      busStop.destroy
    end
    accessGroupService.each do |service|
      service.destroy
    end
    subscribedCustomer.each do |subscribed_customer|
      subscribed_customer.destroy
    end
    @access_group.destroy
    respond_to do |format|
      format.html { redirect_to access_groups_url, notice: 'Access group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access_group_service
      @access_group_service = AccessGroupService.all
    end
    def set_access_group_bus_stop
      @access_group_bus_stop = AccessGroupBusStop.all
    end
    def set_access_group
      @access_group = AccessGroup.find(params[:id])
    end

    def set_subscribed_customer
      @subscribed_customer = SubscribedCustomer.all
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def access_group_params
      params.require(:access_group).permit(:name, :description)
    end
end
