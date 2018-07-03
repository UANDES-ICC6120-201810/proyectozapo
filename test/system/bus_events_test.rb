require "application_system_test_case"

class BusEventsTest < ApplicationSystemTestCase
  setup do
    @bus_event = bus_events(:one)
  end

  test "visiting the index" do
    visit bus_events_url
    assert_selector "h1", text: "Bus Events"
  end

  test "creating a Bus event" do
    visit bus_events_url
    click_on "New Bus Event"

    fill_in "Bus Speed", with: @bus_event.bus_speed
    fill_in "Bus Stop", with: @bus_event.bus_stop_id
    fill_in "Event Time", with: @bus_event.event_time
    fill_in "Vehicle", with: @bus_event.vehicle_id
    click_on "Create Bus event"

    assert_text "Bus event was successfully created"
    click_on "Back"
  end

  test "updating a Bus event" do
    visit bus_events_url
    click_on "Edit", match: :first

    fill_in "Bus Speed", with: @bus_event.bus_speed
    fill_in "Bus Stop", with: @bus_event.bus_stop_id
    fill_in "Event Time", with: @bus_event.event_time
    fill_in "Vehicle", with: @bus_event.vehicle_id
    click_on "Update Bus event"

    assert_text "Bus event was successfully updated"
    click_on "Back"
  end

  test "destroying a Bus event" do
    visit bus_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bus event was successfully destroyed"
  end
end
