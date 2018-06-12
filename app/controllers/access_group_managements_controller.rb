class AccessGroupManagementsController < ApplicationController
  before_action :set_access_group, only: [:services_for_access_group, :bus_stop_for_access_group]

  def services_for_access_group
    @service = Service.all
  end

  def bus_stop_for_access_group
    @bus_stops = BusStop.all
  end

  def update_bus_stop_for_access_group
    ary = params[:bus_stop][:bus_stop]
    ary = ary.drop(1)
    ary.each do |array|
      access_group_bus_stop = AccessGroupBusStop.where(access_group_id: params[:access_group_id] , bus_stop_id: array).first_or_initialize
      access_group_bus_stop.access_group_id = params[:access_group_id]
      access_group_bus_stop.bus_stop_id = array
      access_group_bus_stop.save
    end


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

  def update_services_for_access_group
    ary = params[:services][:services]
    ary = ary.drop(1)
    ary.each do |array|
      access_group_service = AccessGroupService.where(access_group_id: params[:access_group_id], service_id: array).first_or_initialize
      access_group_service.access_group_id = params[:access_group_id]
      access_group_service.service_id = array
      access_group_service.save
    end

  end


  def set_access_group
    @access_group = AccessGroup.find(params[:access_group_id])
  end

end
