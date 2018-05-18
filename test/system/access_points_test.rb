require "application_system_test_case"

class AccessPointsTest < ApplicationSystemTestCase
  setup do
    @access_point = access_points(:one)
  end

  test "visiting the index" do
    visit access_points_url
    assert_selector "h1", text: "Access Points"
  end

  test "creating a Access point" do
    visit access_points_url
    click_on "New Access Point"

    fill_in "Bus Stop", with: @access_point.bus_stop_id
    fill_in "Ip", with: @access_point.ip
    fill_in "Last Message", with: @access_point.last_message
    fill_in "Mac", with: @access_point.mac
    fill_in "Status", with: @access_point.status
    fill_in "Token", with: @access_point.token
    click_on "Create Access point"

    assert_text "Access point was successfully created"
    click_on "Back"
  end

  test "updating a Access point" do
    visit access_points_url
    click_on "Edit", match: :first

    fill_in "Bus Stop", with: @access_point.bus_stop_id
    fill_in "Ip", with: @access_point.ip
    fill_in "Last Message", with: @access_point.last_message
    fill_in "Mac", with: @access_point.mac
    fill_in "Status", with: @access_point.status
    fill_in "Token", with: @access_point.token
    click_on "Update Access point"

    assert_text "Access point was successfully updated"
    click_on "Back"
  end

  test "destroying a Access point" do
    visit access_points_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Access point was successfully destroyed"
  end
end
