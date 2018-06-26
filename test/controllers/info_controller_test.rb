require 'test_helper'

class InfoControllerTest < ActionDispatch::IntegrationTest
  test "should get api_info" do
    get info_api_info_url
    assert_response :success
  end

end
