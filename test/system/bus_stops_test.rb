require "application_system_test_case"

class BusStopsTest < ApplicationSystemTestCase
  setup do
    @bus_stop = bus_stops(:one)
  end

  test "visiting the index" do
    visit bus_stops_url
    assert_selector "h1", text: "Bus Stops"
  end

  test "creating a Bus stop" do
    visit bus_stops_url
    click_on "New Bus Stop"

    fill_in "Code", with: @bus_stop.code
    fill_in "Name", with: @bus_stop.name
    fill_in "Stop Lat", with: @bus_stop.stop_lat
    fill_in "Stop Lon", with: @bus_stop.stop_lon
    click_on "Create Bus stop"

    assert_text "Bus stop was successfully created"
    click_on "Back"
  end

  test "updating a Bus stop" do
    visit bus_stops_url
    click_on "Edit", match: :first

    fill_in "Code", with: @bus_stop.code
    fill_in "Name", with: @bus_stop.name
    fill_in "Stop Lat", with: @bus_stop.stop_lat
    fill_in "Stop Lon", with: @bus_stop.stop_lon
    click_on "Update Bus stop"

    assert_text "Bus stop was successfully updated"
    click_on "Back"
  end

  test "destroying a Bus stop" do
    visit bus_stops_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bus stop was successfully destroyed"
  end
end
