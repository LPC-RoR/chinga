require "application_system_test_case"

class LineasTest < ApplicationSystemTestCase
  setup do
    @linea = lineas(:one)
  end

  test "visiting the index" do
    visit lineas_url
    assert_selector "h1", text: "Lineas"
  end

  test "creating a Linea" do
    visit lineas_url
    click_on "New Linea"

    fill_in "Linea", with: @linea.linea
    fill_in "N linea", with: @linea.n_linea
    fill_in "N parrafo", with: @linea.n_parrafo
    fill_in "Texto", with: @linea.texto_id
    fill_in "Ultima", with: @linea.ultima
    fill_in "Ultima", with: @linea.ultima_id
    click_on "Create Linea"

    assert_text "Linea was successfully created"
    click_on "Back"
  end

  test "updating a Linea" do
    visit lineas_url
    click_on "Edit", match: :first

    fill_in "Linea", with: @linea.linea
    fill_in "N linea", with: @linea.n_linea
    fill_in "N parrafo", with: @linea.n_parrafo
    fill_in "Texto", with: @linea.texto_id
    fill_in "Ultima", with: @linea.ultima
    fill_in "Ultima", with: @linea.ultima_id
    click_on "Update Linea"

    assert_text "Linea was successfully updated"
    click_on "Back"
  end

  test "destroying a Linea" do
    visit lineas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Linea was successfully destroyed"
  end
end
