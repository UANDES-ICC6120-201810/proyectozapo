require "application_system_test_case"

class FilePackagesTest < ApplicationSystemTestCase
  setup do
    @file_package = file_packages(:one)
  end

  test "visiting the index" do
    visit file_packages_url
    assert_selector "h1", text: "File Packages"
  end

  test "creating a File package" do
    visit file_packages_url
    click_on "New File Package"

    fill_in "Name", with: @file_package.name
    click_on "Create File package"

    assert_text "File package was successfully created"
    click_on "Back"
  end

  test "updating a File package" do
    visit file_packages_url
    click_on "Edit", match: :first

    fill_in "Name", with: @file_package.name
    click_on "Update File package"

    assert_text "File package was successfully updated"
    click_on "Back"
  end

  test "destroying a File package" do
    visit file_packages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "File package was successfully destroyed"
  end
end
