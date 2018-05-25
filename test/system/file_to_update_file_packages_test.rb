require "application_system_test_case"

class FileToUpdateFilePackagesTest < ApplicationSystemTestCase
  setup do
    @file_to_update_file_package = file_to_update_file_packages(:one)
  end

  test "visiting the index" do
    visit file_to_update_file_packages_url
    assert_selector "h1", text: "File To Update File Packages"
  end

  test "creating a File to update file package" do
    visit file_to_update_file_packages_url
    click_on "New File To Update File Package"

    fill_in "File Package", with: @file_to_update_file_package.file_package_id
    fill_in "File To Update", with: @file_to_update_file_package.file_to_update_id
    click_on "Create File to update file package"

    assert_text "File to update file package was successfully created"
    click_on "Back"
  end

  test "updating a File to update file package" do
    visit file_to_update_file_packages_url
    click_on "Edit", match: :first

    fill_in "File Package", with: @file_to_update_file_package.file_package_id
    fill_in "File To Update", with: @file_to_update_file_package.file_to_update_id
    click_on "Update File to update file package"

    assert_text "File to update file package was successfully updated"
    click_on "Back"
  end

  test "destroying a File to update file package" do
    visit file_to_update_file_packages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "File to update file package was successfully destroyed"
  end
end
