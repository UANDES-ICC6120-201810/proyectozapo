class FileManagementsController < ApplicationController
  before_action :set_file_package_file_update_ids, only: [:files_for_file_package]
  def files_for_file_package
    @file_to_update = FileToUpdate.all
  end

  def update_files_for_file_package
    @ary_file_to_update = params[:file_to_updates][:file_to_updates]
    @ary_file_to_update = @ary_file_to_update.drop(1)
    delete_file_update_from_file_package
    @ary_file_to_update.each do |array|
      file_to_update_file_package = FileToUpdateFilePackage.where(file_package_id: params[:file_package_id] , file_to_update_id: array).first_or_initialize
      file_to_update_file_package.file_package_id = params[:file_package_id]
      file_to_update_file_package.file_to_update_id = array
      file_to_update_file_package.save
    end
    respond_to do |format|
      format.html {redirect_to file_packages_url, notice: "File Package was successfully updated"}
    end
  end

  def set_file_package_file_update_ids
    file_to_update_file_package = FileToUpdateFilePackage.where(file_package_id: params[:file_package_id])
    @file_to_update_file_package_ids = []
    file_to_update_file_package.each do |file_to_update_file_package|
      @file_to_update_file_package_ids << file_to_update_file_package.file_to_update_id
    end
  end

  private

  def delete_file_update_from_file_package
    actual_file_to_update_id_array = []
    FileToUpdateFilePackage.where(file_package_id: params[:file_package_id]).each do |file_to_update_file_package|
      actual_file_to_update_id_array << file_to_update_file_package.file_to_update_id.to_s
    end
    file_update_id_to_delete = actual_file_to_update_id_array - @ary_file_to_update
    file_update_id_to_delete.each do |file_update_id|
      FileToUpdateFilePackage.where(file_package_id: params[:file_package_id], file_to_update: file_update_id)[0].destroy
    end
  end

end
