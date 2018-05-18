require 'test_helper'

class FileToUpdatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @file_to_update = file_to_updates(:one)
  end

  test "should get index" do
    get file_to_updates_url
    assert_response :success
  end

  test "should get new" do
    get new_file_to_update_url
    assert_response :success
  end

  test "should create file_to_update" do
    assert_difference('FileToUpdate.count') do
      post file_to_updates_url, params: { file_to_update: { file: @file_to_update.file, file_package_id: @file_to_update.file_package_id, name: @file_to_update.name } }
    end

    assert_redirected_to file_to_update_url(FileToUpdate.last)
  end

  test "should show file_to_update" do
    get file_to_update_url(@file_to_update)
    assert_response :success
  end

  test "should get edit" do
    get edit_file_to_update_url(@file_to_update)
    assert_response :success
  end

  test "should update file_to_update" do
    patch file_to_update_url(@file_to_update), params: { file_to_update: { file: @file_to_update.file, file_package_id: @file_to_update.file_package_id, name: @file_to_update.name } }
    assert_redirected_to file_to_update_url(@file_to_update)
  end

  test "should destroy file_to_update" do
    assert_difference('FileToUpdate.count', -1) do
      delete file_to_update_url(@file_to_update)
    end

    assert_redirected_to file_to_updates_url
  end
end
