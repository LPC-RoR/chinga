require "application_system_test_case"

class FormaMusicalesTest < ApplicationSystemTestCase
  setup do
    @forma_musical = forma_musicales(:one)
  end

  test "visiting the index" do
    visit forma_musicales_url
    assert_selector "h1", text: "Forma Musicales"
  end

  test "creating a Forma musical" do
    visit forma_musicales_url
    click_on "New Forma Musical"

    fill_in "Forma musical", with: @forma_musical.forma_musical
    fill_in "Owner", with: @forma_musical.owner_id
    click_on "Create Forma musical"

    assert_text "Forma musical was successfully created"
    click_on "Back"
  end

  test "updating a Forma musical" do
    visit forma_musicales_url
    click_on "Edit", match: :first

    fill_in "Forma musical", with: @forma_musical.forma_musical
    fill_in "Owner", with: @forma_musical.owner_id
    click_on "Update Forma musical"

    assert_text "Forma musical was successfully updated"
    click_on "Back"
  end

  test "destroying a Forma musical" do
    visit forma_musicales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forma musical was successfully destroyed"
  end
end
