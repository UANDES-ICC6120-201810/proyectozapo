require "application_system_test_case"

class FileToUpdatesTest < ApplicationSystemTestCase
  setup do
    @file_to_update = file_to_updates(:one)
  end

  test "visiting the index" do
    visit file_to_updates_url
    assert_selector "h1", text: "File To Updates"
  end

  test "creating a File to update" do
    visit file_to_updates_url
    click_on "New File To Update"

    fill_in "File", with: @file_to_update.file
    fill_in "File Package", with: @file_to_update.file_package_id
    fill_in "Name", with: @file_to_update.name
    click_on "Create File to update"

    assert_text "File to update was successfully created"
    click_on "Back"
  end

  test "updating a File to update" do
    visit file_to_updates_url
    click_on "Edit", match: :first

    fill_in "File", with: @file_to_update.file
    fill_in "File Package", with: @file_to_update.file_package_id
    fill_in "Name", with: @file_to_update.name
    click_on "Update File to update"

    assert_text "File to update was successfully updated"
    click_on "Back"
  end

  test "destroying a File to update" do
    visit file_to_updates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "File to update was successfully destroyed"
  end
end
