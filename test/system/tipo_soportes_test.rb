require "application_system_test_case"

class TipoSoportesTest < ApplicationSystemTestCase
  setup do
    @tipo_soporte = tipo_soportes(:one)
  end

  test "visiting the index" do
    visit tipo_soportes_url
    assert_selector "h1", text: "Tipo Soportes"
  end

  test "creating a Tipo soporte" do
    visit tipo_soportes_url
    click_on "New Tipo Soporte"

    fill_in "Tipo soporte", with: @tipo_soporte.tipo_soporte
    click_on "Create Tipo soporte"

    assert_text "Tipo soporte was successfully created"
    click_on "Back"
  end

  test "updating a Tipo soporte" do
    visit tipo_soportes_url
    click_on "Edit", match: :first

    fill_in "Tipo soporte", with: @tipo_soporte.tipo_soporte
    click_on "Update Tipo soporte"

    assert_text "Tipo soporte was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo soporte" do
    visit tipo_soportes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo soporte was successfully destroyed"
  end
end
