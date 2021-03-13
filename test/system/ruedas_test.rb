require "application_system_test_case"

class RuedasTest < ApplicationSystemTestCase
  setup do
    @rueda = ruedas(:one)
  end

  test "visiting the index" do
    visit ruedas_url
    assert_selector "h1", text: "Ruedas"
  end

  test "creating a Rueda" do
    visit ruedas_url
    click_on "New Rueda"

    fill_in "Administrador", with: @rueda.administrador_id
    fill_in "Invitacion", with: @rueda.invitacion
    fill_in "Rueda", with: @rueda.rueda
    fill_in "Ubicacion", with: @rueda.ubicacion
    click_on "Create Rueda"

    assert_text "Rueda was successfully created"
    click_on "Back"
  end

  test "updating a Rueda" do
    visit ruedas_url
    click_on "Edit", match: :first

    fill_in "Administrador", with: @rueda.administrador_id
    fill_in "Invitacion", with: @rueda.invitacion
    fill_in "Rueda", with: @rueda.rueda
    fill_in "Ubicacion", with: @rueda.ubicacion
    click_on "Update Rueda"

    assert_text "Rueda was successfully updated"
    click_on "Back"
  end

  test "destroying a Rueda" do
    visit ruedas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rueda was successfully destroyed"
  end
end
