require 'test_helper'

class BusEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus_event = bus_events(:one)
  end

  test "should get index" do
    get bus_events_url
    assert_response :success
  end

  test "should get new" do
    get new_bus_event_url
    assert_response :success
  end

  test "should create bus_event" do
    assert_difference('BusEvent.count') do
      post bus_events_url, params: { bus_event: { bus_speed: @bus_event.bus_speed, bus_stop_id: @bus_event.bus_stop_id, event_time: @bus_event.event_time, vehicle_id: @bus_event.vehicle_id } }
    end

    assert_redirected_to bus_event_url(BusEvent.last)
  end

  test "should show bus_event" do
    get bus_event_url(@bus_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_bus_event_url(@bus_event)
    assert_response :success
  end

  test "should update bus_event" do
    patch bus_event_url(@bus_event), params: { bus_event: { bus_speed: @bus_event.bus_speed, bus_stop_id: @bus_event.bus_stop_id, event_time: @bus_event.event_time, vehicle_id: @bus_event.vehicle_id } }
    assert_redirected_to bus_event_url(@bus_event)
  end

  test "should destroy bus_event" do
    assert_difference('BusEvent.count', -1) do
      delete bus_event_url(@bus_event)
    end

    assert_redirected_to bus_events_url
  end
end
