require "application_system_test_case"

class GeneroAutoresTest < ApplicationSystemTestCase
  setup do
    @genero_autor = genero_autores(:one)
  end

  test "visiting the index" do
    visit genero_autores_url
    assert_selector "h1", text: "Genero Autores"
  end

  test "creating a Genero autor" do
    visit genero_autores_url
    click_on "New Genero Autor"

    fill_in "Genero autor", with: @genero_autor.genero_autor
    fill_in "Owner", with: @genero_autor.owner_id
    click_on "Create Genero autor"

    assert_text "Genero autor was successfully created"
    click_on "Back"
  end

  test "updating a Genero autor" do
    visit genero_autores_url
    click_on "Edit", match: :first

    fill_in "Genero autor", with: @genero_autor.genero_autor
    fill_in "Owner", with: @genero_autor.owner_id
    click_on "Update Genero autor"

    assert_text "Genero autor was successfully updated"
    click_on "Back"
  end

  test "destroying a Genero autor" do
    visit genero_autores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Genero autor was successfully destroyed"
  end
end
