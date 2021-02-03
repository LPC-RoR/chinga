require "application_system_test_case"

class UltimasTest < ApplicationSystemTestCase
  setup do
    @ultima = ultimas(:one)
  end

  test "visiting the index" do
    visit ultimas_url
    assert_selector "h1", text: "Ultimas"
  end

  test "creating a Ultima" do
    visit ultimas_url
    click_on "New Ultima"

    fill_in "Sha1", with: @ultima.sha1
    fill_in "Ultima", with: @ultima.ultima
    click_on "Create Ultima"

    assert_text "Ultima was successfully created"
    click_on "Back"
  end

  test "updating a Ultima" do
    visit ultimas_url
    click_on "Edit", match: :first

    fill_in "Sha1", with: @ultima.sha1
    fill_in "Ultima", with: @ultima.ultima
    click_on "Update Ultima"

    assert_text "Ultima was successfully updated"
    click_on "Back"
  end

  test "destroying a Ultima" do
    visit ultimas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ultima was successfully destroyed"
  end
end
