require "application_system_test_case"

class InterpretesTest < ApplicationSystemTestCase
  setup do
    @interprete = interpretes(:one)
  end

  test "visiting the index" do
    visit interpretes_url
    assert_selector "h1", text: "Interpretes"
  end

  test "creating a Interprete" do
    visit interpretes_url
    click_on "New Interprete"

    fill_in "Interprete", with: @interprete.interprete
    fill_in "Perfil", with: @interprete.perfil_id
    click_on "Create Interprete"

    assert_text "Interprete was successfully created"
    click_on "Back"
  end

  test "updating a Interprete" do
    visit interpretes_url
    click_on "Edit", match: :first

    fill_in "Interprete", with: @interprete.interprete
    fill_in "Perfil", with: @interprete.perfil_id
    click_on "Update Interprete"

    assert_text "Interprete was successfully updated"
    click_on "Back"
  end

  test "destroying a Interprete" do
    visit interpretes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interprete was successfully destroyed"
  end
end
