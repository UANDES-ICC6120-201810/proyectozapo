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

  def new
    @access_group_service = AccessGroupService.new
    @access_group_bus_stop = AccessGroupBusStop.new
  end

  # POST /access_group_managements
  # POST /access_group_managements.json
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

  def set_access_group
    @access_group = AccessGroup.find(params[:access_group_id])
  end

end
