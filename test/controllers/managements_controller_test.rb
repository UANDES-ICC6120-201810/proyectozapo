require 'test_helper'

class ManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get manage_user" do
    get managements_manage_user_url
    assert_response :success
  end

end
