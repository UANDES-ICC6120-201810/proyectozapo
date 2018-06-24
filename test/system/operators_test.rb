require "application_system_test_case"

class OperatorsTest < ApplicationSystemTestCase
  setup do
    @operator = operators(:one)
  end

  test "visiting the index" do
    visit operators_url
    assert_selector "h1", text: "Operators"
  end

  test "creating a Operator" do
    visit operators_url
    click_on "New Operator"

    fill_in "Name", with: @operator.name
    fill_in "Operator Number", with: @operator.operator_number
    click_on "Create Operator"

    assert_text "Operator was successfully created"
    click_on "Back"
  end

  test "updating a Operator" do
    visit operators_url
    click_on "Edit", match: :first

    fill_in "Name", with: @operator.name
    fill_in "Operator Number", with: @operator.operator_number
    click_on "Update Operator"

    assert_text "Operator was successfully updated"
    click_on "Back"
  end

  test "destroying a Operator" do
    visit operators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Operator was successfully destroyed"
  end
end
