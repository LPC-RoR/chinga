require "application_system_test_case"

class ElementosTest < ApplicationSystemTestCase
  setup do
    @elemento = elementos(:one)
  end

  test "visiting the index" do
    visit elementos_url
    assert_selector "h1", text: "Elementos"
  end

  test "creating a Elemento" do
    visit elementos_url
    click_on "New Elemento"

    fill_in "Annio creacion", with: @elemento.annio_creacion
    fill_in "Annio estreno", with: @elemento.annio_estreno
    fill_in "Autor", with: @elemento.autor
    fill_in "Ciudad autor", with: @elemento.ciudad_autor
    fill_in "Disco", with: @elemento.disco
    fill_in "Forma musical", with: @elemento.forma_musical
    fill_in "Genero", with: @elemento.genero
    fill_in "Interprete", with: @elemento.interprete
    fill_in "Letra", with: @elemento.letra
    fill_in "Link", with: @elemento.link
    fill_in "Otro soporte", with: @elemento.otro_soporte
    fill_in "Pais", with: @elemento.pais
    fill_in "Titulo", with: @elemento.titulo
    click_on "Create Elemento"

    assert_text "Elemento was successfully created"
    click_on "Back"
  end

  test "updating a Elemento" do
    visit elementos_url
    click_on "Edit", match: :first

    fill_in "Annio creacion", with: @elemento.annio_creacion
    fill_in "Annio estreno", with: @elemento.annio_estreno
    fill_in "Autor", with: @elemento.autor
    fill_in "Ciudad autor", with: @elemento.ciudad_autor
    fill_in "Disco", with: @elemento.disco
    fill_in "Forma musical", with: @elemento.forma_musical
    fill_in "Genero", with: @elemento.genero
    fill_in "Interprete", with: @elemento.interprete
    fill_in "Letra", with: @elemento.letra
    fill_in "Link", with: @elemento.link
    fill_in "Otro soporte", with: @elemento.otro_soporte
    fill_in "Pais", with: @elemento.pais
    fill_in "Titulo", with: @elemento.titulo
    click_on "Update Elemento"

    assert_text "Elemento was successfully updated"
    click_on "Back"
  end

  test "destroying a Elemento" do
    visit elementos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Elemento was successfully destroyed"
  end
end
