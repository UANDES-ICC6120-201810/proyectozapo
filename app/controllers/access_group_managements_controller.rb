class AccessGroupManagementsController < ApplicationController
  before_action :set_access_group, only: [:services_for_access_group, :bus_stop_for_access_group]

  def services_for_access_group
    @service = Service.all
  end

  def bus_stop_for_access_group
    @bus_stops = BusStop.all
  end

  def update_bus_stop_for_access_group
    puts("HOLAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
    access_group_bus_stop = AccessGroupBusStop.new
    access_group_bus_stop.access_group_id = @access_group.id
    access_group_bus_stop.bus_stop_id = @access_group.id
    access_group_bus_stop.save
  end

  def update_services_for_access_group
    access_group_service = AccessGroupService.create
    access_group_service.access_group_id = @access_group.id
    access_group_service.service_id = @access_group.id
    access_group_service.save
  end

  def set_access_group
    @access_group = AccessGroup.find(params[:access_group_id])
  end

end
