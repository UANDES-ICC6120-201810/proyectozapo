require 'test_helper'

class FileToUpdateFilePackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @file_to_update_file_package = file_to_update_file_packages(:one)
  end

  test "should get index" do
    get file_to_update_file_packages_url
    assert_response :success
  end

  test "should get new" do
    get new_file_to_update_file_package_url
    assert_response :success
  end

  test "should create file_to_update_file_package" do
    assert_difference('FileToUpdateFilePackage.count') do
      post file_to_update_file_packages_url, params: { file_to_update_file_package: { file_package_id: @file_to_update_file_package.file_package_id, file_to_update_id: @file_to_update_file_package.file_to_update_id } }
    end

    assert_redirected_to file_to_update_file_package_url(FileToUpdateFilePackage.last)
  end

  test "should show file_to_update_file_package" do
    get file_to_update_file_package_url(@file_to_update_file_package)
    assert_response :success
  end

  test "should get edit" do
    get edit_file_to_update_file_package_url(@file_to_update_file_package)
    assert_response :success
  end

  test "should update file_to_update_file_package" do
    patch file_to_update_file_package_url(@file_to_update_file_package), params: { file_to_update_file_package: { file_package_id: @file_to_update_file_package.file_package_id, file_to_update_id: @file_to_update_file_package.file_to_update_id } }
    assert_redirected_to file_to_update_file_package_url(@file_to_update_file_package)
  end

  test "should destroy file_to_update_file_package" do
    assert_difference('FileToUpdateFilePackage.count', -1) do
      delete file_to_update_file_package_url(@file_to_update_file_package)
    end

    assert_redirected_to file_to_update_file_packages_url
  end
end
