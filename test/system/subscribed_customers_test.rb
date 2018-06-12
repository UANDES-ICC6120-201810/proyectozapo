require "application_system_test_case"

class SubscribedCustomersTest < ApplicationSystemTestCase
  setup do
    @subscribed_customer = subscribed_customers(:one)
  end

  test "visiting the index" do
    visit subscribed_customers_url
    assert_selector "h1", text: "Subscribed Customers"
  end

  test "creating a Subscribed customer" do
    visit subscribed_customers_url
    click_on "New Subscribed Customer"

    fill_in "Access Group", with: @subscribed_customer.access_group_id
    fill_in "Description", with: @subscribed_customer.description
    fill_in "Name", with: @subscribed_customer.name
    click_on "Create Subscribed customer"

    assert_text "Subscribed customer was successfully created"
    click_on "Back"
  end

  test "updating a Subscribed customer" do
    visit subscribed_customers_url
    click_on "Edit", match: :first

    fill_in "Access Group", with: @subscribed_customer.access_group_id
    fill_in "Description", with: @subscribed_customer.description
    fill_in "Name", with: @subscribed_customer.name
    click_on "Update Subscribed customer"

    assert_text "Subscribed customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Subscribed customer" do
    visit subscribed_customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscribed customer was successfully destroyed"
  end
end
