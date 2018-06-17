require 'test_helper'

class AccessGroupManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get services_for_access_group" do
    get access_group_managements_services_for_access_group_url
    assert_response :success
  end

  test "should get bus_stop_for_access_group" do
    get access_group_managements_bus_stop_for_access_group_url
    assert_response :success
  end

end
