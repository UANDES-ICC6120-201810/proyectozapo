require 'test_helper'

class FileManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get files_for_file_package" do
    get file_managements_files_for_file_package_url
    assert_response :success
  end

end
