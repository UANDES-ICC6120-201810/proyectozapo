require 'test_helper'

class BusStopCongestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus_stop_congestion = bus_stop_congestions(:one)
  end

  test "should get index" do
    get bus_stop_congestions_url
    assert_response :success
  end

  test "should get new" do
    get new_bus_stop_congestion_url
    assert_response :success
  end

  test "should create bus_stop_congestion" do
    assert_difference('BusStopCongestion.count') do
      post bus_stop_congestions_url, params: { bus_stop_congestion: { amount_of_people: @bus_stop_congestion.amount_of_people, bus_stop_id: @bus_stop_congestion.bus_stop_id, event_time: @bus_stop_congestion.event_time } }
    end

    assert_redirected_to bus_stop_congestion_url(BusStopCongestion.last)
  end

  test "should show bus_stop_congestion" do
    get bus_stop_congestion_url(@bus_stop_congestion)
    assert_response :success
  end

  test "should get edit" do
    get edit_bus_stop_congestion_url(@bus_stop_congestion)
    assert_response :success
  end

  test "should update bus_stop_congestion" do
    patch bus_stop_congestion_url(@bus_stop_congestion), params: { bus_stop_congestion: { amount_of_people: @bus_stop_congestion.amount_of_people, bus_stop_id: @bus_stop_congestion.bus_stop_id, event_time: @bus_stop_congestion.event_time } }
    assert_redirected_to bus_stop_congestion_url(@bus_stop_congestion)
  end

  test "should destroy bus_stop_congestion" do
    assert_difference('BusStopCongestion.count', -1) do
      delete bus_stop_congestion_url(@bus_stop_congestion)
    end

    assert_redirected_to bus_stop_congestions_url
  end
end
