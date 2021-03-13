require "application_system_test_case"

class ClavesTest < ApplicationSystemTestCase
  setup do
    @clave = claves(:one)
  end

  test "visiting the index" do
    visit claves_url
    assert_selector "h1", text: "Claves"
  end

  test "creating a Clave" do
    visit claves_url
    click_on "New Clave"

    fill_in "Clave", with: @clave.clave
    fill_in "Orden", with: @clave.orden
    fill_in "Sha1", with: @clave.sha1
    click_on "Create Clave"

    assert_text "Clave was successfully created"
    click_on "Back"
  end

  test "updating a Clave" do
    visit claves_url
    click_on "Edit", match: :first

    fill_in "Clave", with: @clave.clave
    fill_in "Orden", with: @clave.orden
    fill_in "Sha1", with: @clave.sha1
    click_on "Update Clave"

    assert_text "Clave was successfully updated"
    click_on "Back"
  end

  test "destroying a Clave" do
    visit claves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clave was successfully destroyed"
  end
end
