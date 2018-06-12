require 'test_helper'

class SubscribedCustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscribed_customer = subscribed_customers(:one)
  end

  test "should get index" do
    get subscribed_customers_url
    assert_response :success
  end

  test "should get new" do
    get new_subscribed_customer_url
    assert_response :success
  end

  test "should create subscribed_customer" do
    assert_difference('SubscribedCustomer.count') do
      post subscribed_customers_url, params: { subscribed_customer: { access_group_id: @subscribed_customer.access_group_id, description: @subscribed_customer.description, name: @subscribed_customer.name } }
    end

    assert_redirected_to subscribed_customer_url(SubscribedCustomer.last)
  end

  test "should show subscribed_customer" do
    get subscribed_customer_url(@subscribed_customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscribed_customer_url(@subscribed_customer)
    assert_response :success
  end

  test "should update subscribed_customer" do
    patch subscribed_customer_url(@subscribed_customer), params: { subscribed_customer: { access_group_id: @subscribed_customer.access_group_id, description: @subscribed_customer.description, name: @subscribed_customer.name } }
    assert_redirected_to subscribed_customer_url(@subscribed_customer)
  end

  test "should destroy subscribed_customer" do
    assert_difference('SubscribedCustomer.count', -1) do
      delete subscribed_customer_url(@subscribed_customer)
    end

    assert_redirected_to subscribed_customers_url
  end
end
