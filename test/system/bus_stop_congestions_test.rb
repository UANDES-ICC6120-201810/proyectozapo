require "application_system_test_case"

class BusStopCongestionsTest < ApplicationSystemTestCase
  setup do
    @bus_stop_congestion = bus_stop_congestions(:one)
  end

  test "visiting the index" do
    visit bus_stop_congestions_url
    assert_selector "h1", text: "Bus Stop Congestions"
  end

  test "creating a Bus stop congestion" do
    visit bus_stop_congestions_url
    click_on "New Bus Stop Congestion"

    fill_in "Amount Of People", with: @bus_stop_congestion.amount_of_people
    fill_in "Bus Stop", with: @bus_stop_congestion.bus_stop_id
    fill_in "Event Time", with: @bus_stop_congestion.event_time
    click_on "Create Bus stop congestion"

    assert_text "Bus stop congestion was successfully created"
    click_on "Back"
  end

  test "updating a Bus stop congestion" do
    visit bus_stop_congestions_url
    click_on "Edit", match: :first

    fill_in "Amount Of People", with: @bus_stop_congestion.amount_of_people
    fill_in "Bus Stop", with: @bus_stop_congestion.bus_stop_id
    fill_in "Event Time", with: @bus_stop_congestion.event_time
    click_on "Update Bus stop congestion"

    assert_text "Bus stop congestion was successfully updated"
    click_on "Back"
  end

  test "destroying a Bus stop congestion" do
    visit bus_stop_congestions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bus stop congestion was successfully destroyed"
  end
end
