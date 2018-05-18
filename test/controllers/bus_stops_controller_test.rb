require 'test_helper'

class BusStopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus_stop = bus_stops(:one)
  end

  test "should get index" do
    get bus_stops_url
    assert_response :success
  end

  test "should get new" do
    get new_bus_stop_url
    assert_response :success
  end

  test "should create bus_stop" do
    assert_difference('BusStop.count') do
      post bus_stops_url, params: { bus_stop: { code: @bus_stop.code, name: @bus_stop.name, stop_lat: @bus_stop.stop_lat, stop_lon: @bus_stop.stop_lon } }
    end

    assert_redirected_to bus_stop_url(BusStop.last)
  end

  test "should show bus_stop" do
    get bus_stop_url(@bus_stop)
    assert_response :success
  end

  test "should get edit" do
    get edit_bus_stop_url(@bus_stop)
    assert_response :success
  end

  test "should update bus_stop" do
    patch bus_stop_url(@bus_stop), params: { bus_stop: { code: @bus_stop.code, name: @bus_stop.name, stop_lat: @bus_stop.stop_lat, stop_lon: @bus_stop.stop_lon } }
    assert_redirected_to bus_stop_url(@bus_stop)
  end

  test "should destroy bus_stop" do
    assert_difference('BusStop.count', -1) do
      delete bus_stop_url(@bus_stop)
    end

    assert_redirected_to bus_stops_url
  end
end
