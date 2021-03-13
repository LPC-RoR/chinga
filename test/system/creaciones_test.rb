require "application_system_test_case"

class CreacionesTest < ApplicationSystemTestCase
  setup do
    @creacion = creaciones(:one)
  end

  test "visiting the index" do
    visit creaciones_url
    assert_selector "h1", text: "Creaciones"
  end

  test "creating a Creacion" do
    visit creaciones_url
    click_on "New Creacion"

    fill_in "Autor", with: @creacion.autor_id
    fill_in "Elemento", with: @creacion.elemento_id
    click_on "Create Creacion"

    assert_text "Creacion was successfully created"
    click_on "Back"
  end

  test "updating a Creacion" do
    visit creaciones_url
    click_on "Edit", match: :first

    fill_in "Autor", with: @creacion.autor_id
    fill_in "Elemento", with: @creacion.elemento_id
    click_on "Update Creacion"

    assert_text "Creacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Creacion" do
    visit creaciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Creacion was successfully destroyed"
  end
end
