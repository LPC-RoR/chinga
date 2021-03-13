require "application_system_test_case"

class EstructuraPoeticasTest < ApplicationSystemTestCase
  setup do
    @estructura_poetica = estructura_poeticas(:one)
  end

  test "visiting the index" do
    visit estructura_poeticas_url
    assert_selector "h1", text: "Estructura Poeticas"
  end

  test "creating a Estructura poetica" do
    visit estructura_poeticas_url
    click_on "New Estructura Poetica"

    fill_in "Estructura poetica", with: @estructura_poetica.estructura_poetica
    fill_in "Owner", with: @estructura_poetica.owner_id
    click_on "Create Estructura poetica"

    assert_text "Estructura poetica was successfully created"
    click_on "Back"
  end

  test "updating a Estructura poetica" do
    visit estructura_poeticas_url
    click_on "Edit", match: :first

    fill_in "Estructura poetica", with: @estructura_poetica.estructura_poetica
    fill_in "Owner", with: @estructura_poetica.owner_id
    click_on "Update Estructura poetica"

    assert_text "Estructura poetica was successfully updated"
    click_on "Back"
  end

  test "destroying a Estructura poetica" do
    visit estructura_poeticas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estructura poetica was successfully destroyed"
  end
end
