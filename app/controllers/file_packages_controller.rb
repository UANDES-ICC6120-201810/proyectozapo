class FilePackagesController < ApplicationController
  before_action :set_file_package, only: [:show, :edit, :update, :destroy]

  # GET /file_packages
  # GET /file_packages.json
  def index
    @file_packages = FilePackage.all
  end

  # GET /file_packages/1
  # GET /file_packages/1.json
  def show
  end

  # GET /file_packages/new
  def new
    @file_package = FilePackage.new
  end

  # GET /file_packages/1/edit
  def edit
  end

  # POST /file_packages
  # POST /file_packages.json
  def create
    @file_package = FilePackage.new(file_package_params)

    respond_to do |format|
      if @file_package.save
        format.html { redirect_to @file_package, notice: 'File package was successfully created.' }
        format.json { render :show, status: :created, location: @file_package }
      else
        format.html { render :new }
        format.json { render json: @file_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_packages/1
  # PATCH/PUT /file_packages/1.json
  def update
    respond_to do |format|
      if @file_package.update(file_package_params)
        format.html { redirect_to @file_package, notice: 'File package was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_package }
      else
        format.html { render :edit }
        format.json { render json: @file_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_packages/1
  # DELETE /file_packages/1.json
  def destroy
    @file_package.destroy
    respond_to do |format|
      format.html { redirect_to file_packages_url, notice: 'File package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_package
      @file_package = FilePackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_package_params
      params.require(:file_package).permit(:name)
    end
end
