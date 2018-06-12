class AccessGroupManagementsController < ApplicationController
  before_action :set_access_group, only: [:services_for_access_group, :bus_stop_for_access_group]

  def services_for_access_group
    @service = Service.all
  end

  def bus_stop_for_access_group
    @bus_stops = BusStop.all
  end

  def update_bus_stop_for_access_group
    @ary_bus_stop = params[:bus_stop][:bus_stop]
    @ary_bus_stop = @ary_bus_stop.drop(1)
    delete_bus_stop_from_access_group
    @ary_bus_stop.each do |array|
      access_group_bus_stop = AccessGroupBusStop.where(access_group_id: params[:access_group_id] , bus_stop_id: array).first_or_initialize
      access_group_bus_stop.access_group_id = params[:access_group_id]
      access_group_bus_stop.bus_stop_id = array
      access_group_bus_stop.save
    end
    respond_to do |format|
      format.html {redirect_to access_groups_url, notice: "Bus Stop was successfully updated"}
    end
  end

  def update_services_for_access_group
    @ary_services = params[:services][:services]
    @ary_services = @ary_services.drop(1)
    delete_sevices_from_access_group
    @ary_services.each do |array|
      access_group_service = AccessGroupService.where(access_group_id: params[:access_group_id], service_id: array).first_or_initialize
      access_group_service.access_group_id = params[:access_group_id]
      access_group_service.service_id = array
      access_group_service.save
    end
    respond_to do |format|
      format.html {redirect_to access_groups_url, notice: "Service was successfully updated"}
    end
  end


  def set_access_group
    @access_group = AccessGroup.find(params[:access_group_id])
  end

  # def set_access_group_bus_stop_ids
  #   access_group_bus_stop = AccessGroupBusStop.where(access_group_id: params[:access_group_id])
  #   @access_group_bus_stop_ids = []
  #   access_group_bus_stop.each do |ag|
  #     @access_group_bus_stop_ids << ag.bus_stop_id
  #   end
  # end

  private

  def delete_bus_stop_from_access_group
    actual_bus_stop_id_array = []
    AccessGroupBusStop.where(access_group_id: params[:access_group_id]).each do |access_group_bus_stop|
      actual_bus_stop_id_array << access_group_bus_stop.bus_stop_id.to_s
    end
    bus_stop_id_to_delete = actual_bus_stop_id_array - @ary_bus_stop
    bus_stop_id_to_delete.each do |bus_stop_id|
      AccessGroupBusStop.where(access_group_id: params[:access_group_id], bus_stop_id: bus_stop_id)[0].destroy
    end
  end

  def delete_sevices_from_access_group
    actual_service_id_array = []
    AccessGroupService.where(access_group_id: params[:access_group_id]).each do |access_group_service|
      actual_service_id_array << access_group_service.service_id.to_s
    end
    service_id_to_delete = actual_service_id_array - @ary_services
    service_id_to_delete.each do |service_id|
      AccessGroupBusStop.where(access_group_id: params[:access_group_id], service_id: service_id)[0].destroy
    end
  end
end
