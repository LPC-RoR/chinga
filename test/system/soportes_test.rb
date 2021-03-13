require "application_system_test_case"

class SoportesTest < ApplicationSystemTestCase
  setup do
    @soporte = soportes(:one)
  end

  test "visiting the index" do
    visit soportes_url
    assert_selector "h1", text: "Soportes"
  end

  test "creating a Soporte" do
    visit soportes_url
    click_on "New Soporte"

    fill_in "Anio", with: @soporte.anio
    fill_in "Soporte", with: @soporte.soporte
    fill_in "Tipo", with: @soporte.tipo
    click_on "Create Soporte"

    assert_text "Soporte was successfully created"
    click_on "Back"
  end

  test "updating a Soporte" do
    visit soportes_url
    click_on "Edit", match: :first

    fill_in "Anio", with: @soporte.anio
    fill_in "Soporte", with: @soporte.soporte
    fill_in "Tipo", with: @soporte.tipo
    click_on "Update Soporte"

    assert_text "Soporte was successfully updated"
    click_on "Back"
  end

  test "destroying a Soporte" do
    visit soportes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Soporte was successfully destroyed"
  end
end
