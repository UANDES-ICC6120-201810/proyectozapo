require 'test_helper'

class FilePackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @file_package = file_packages(:one)
  end

  test "should get index" do
    get file_packages_url
    assert_response :success
  end

  test "should get new" do
    get new_file_package_url
    assert_response :success
  end

  test "should create file_package" do
    assert_difference('FilePackage.count') do
      post file_packages_url, params: { file_package: { name: @file_package.name } }
    end

    assert_redirected_to file_package_url(FilePackage.last)
  end

  test "should show file_package" do
    get file_package_url(@file_package)
    assert_response :success
  end

  test "should get edit" do
    get edit_file_package_url(@file_package)
    assert_response :success
  end

  test "should update file_package" do
    patch file_package_url(@file_package), params: { file_package: { name: @file_package.name } }
    assert_redirected_to file_package_url(@file_package)
  end

  test "should destroy file_package" do
    assert_difference('FilePackage.count', -1) do
      delete file_package_url(@file_package)
    end

    assert_redirected_to file_packages_url
  end
end
