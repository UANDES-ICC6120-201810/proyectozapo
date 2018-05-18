class FileToUpdatesController < ApplicationController
  before_action :set_file_to_update, only: [:show, :edit, :update, :destroy]

  # GET /file_to_updates
  # GET /file_to_updates.json
  def index
    @file_to_updates = FileToUpdate.all
  end

  # GET /file_to_updates/1
  # GET /file_to_updates/1.json
  def show
  end

  # GET /file_to_updates/new
  def new
    @file_to_update = FileToUpdate.new
  end

  # GET /file_to_updates/1/edit
  def edit
  end

  # POST /file_to_updates
  # POST /file_to_updates.json
  def create
    @file_to_update = FileToUpdate.new(file_to_update_params)

    respond_to do |format|
      if @file_to_update.save
        format.html { redirect_to @file_to_update, notice: 'File to update was successfully created.' }
        format.json { render :show, status: :created, location: @file_to_update }
      else
        format.html { render :new }
        format.json { render json: @file_to_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_to_updates/1
  # PATCH/PUT /file_to_updates/1.json
  def update
    respond_to do |format|
      if @file_to_update.update(file_to_update_params)
        format.html { redirect_to @file_to_update, notice: 'File to update was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_to_update }
      else
        format.html { render :edit }
        format.json { render json: @file_to_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_to_updates/1
  # DELETE /file_to_updates/1.json
  def destroy
    @file_to_update.destroy
    respond_to do |format|
      format.html { redirect_to file_to_updates_url, notice: 'File to update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_to_update
      @file_to_update = FileToUpdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_to_update_params
      params.require(:file_to_update).permit(:file_package_id, :name, :file)
    end
end
