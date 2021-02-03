require "application_system_test_case"

class ListasTest < ApplicationSystemTestCase
  setup do
    @lista = listas(:one)
  end

  test "visiting the index" do
    visit listas_url
    assert_selector "h1", text: "Listas"
  end

  test "creating a Lista" do
    visit listas_url
    click_on "New Lista"

    fill_in "Lista", with: @lista.lista
    fill_in "Perfil", with: @lista.perfil_id
    click_on "Create Lista"

    assert_text "Lista was successfully created"
    click_on "Back"
  end

  test "updating a Lista" do
    visit listas_url
    click_on "Edit", match: :first

    fill_in "Lista", with: @lista.lista
    fill_in "Perfil", with: @lista.perfil_id
    click_on "Update Lista"

    assert_text "Lista was successfully updated"
    click_on "Back"
  end

  test "destroying a Lista" do
    visit listas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lista was successfully destroyed"
  end
end
