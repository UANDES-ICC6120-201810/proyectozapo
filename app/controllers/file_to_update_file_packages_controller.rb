class FileToUpdateFilePackagesController < ApplicationController
  before_action :set_file_to_update_file_package, only: [:show, :edit, :update, :destroy]

  # GET /file_to_update_file_packages
  # GET /file_to_update_file_packages.json
  def index
    @file_to_update_file_packages = FileToUpdateFilePackage.all
  end

  # GET /file_to_update_file_packages/1
  # GET /file_to_update_file_packages/1.json
  def show
  end

  # GET /file_to_update_file_packages/new
  def new
    @file_to_update_file_package = FileToUpdateFilePackage.new
    @file_package = FilePackage.find(params[:file_package_id])
  end

  # GET /file_to_update_file_packages/1/edit
  def edit
  end

  # POST /file_to_update_file_packages
  # POST /file_to_update_file_packages.json
  def create
    @file_to_update_file_package = FileToUpdateFilePackage.new(file_to_update_file_package_params)

    respond_to do |format|
      if @file_to_update_file_package.save
        format.html { redirect_to @file_to_update_file_package, notice: 'File to update file package was successfully created.' }
        format.json { render :show, status: :created, location: @file_to_update_file_package }
      else
        format.html { render :new }
        format.json { render json: @file_to_update_file_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_to_update_file_packages/1
  # PATCH/PUT /file_to_update_file_packages/1.json
  def update
    respond_to do |format|
      if @file_to_update_file_package.update(file_to_update_file_package_params)
        format.html { redirect_to @file_to_update_file_package, notice: 'File to update file package was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_to_update_file_package }
      else
        format.html { render :edit }
        format.json { render json: @file_to_update_file_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_to_update_file_packages/1
  # DELETE /file_to_update_file_packages/1.json
  def destroy
    @file_to_update_file_package.destroy
    respond_to do |format|
      format.html { redirect_to file_to_update_file_packages_url, notice: 'File to update file package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_to_update_file_package
      @file_to_update_file_package = FileToUpdateFilePackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_to_update_file_package_params
      params.require(:file_to_update_file_package).permit(:file_to_update_id, :file_package_id)
    end
end
