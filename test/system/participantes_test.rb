require "application_system_test_case"

class ParticipantesTest < ApplicationSystemTestCase
  setup do
    @participante = participantes(:one)
  end

  test "visiting the index" do
    visit participantes_url
    assert_selector "h1", text: "Participantes"
  end

  test "creating a Participante" do
    visit participantes_url
    click_on "New Participante"

    fill_in "Perfil", with: @participante.perfil_id
    fill_in "Rueda", with: @participante.rueda_id
    click_on "Create Participante"

    assert_text "Participante was successfully created"
    click_on "Back"
  end

  test "updating a Participante" do
    visit participantes_url
    click_on "Edit", match: :first

    fill_in "Perfil", with: @participante.perfil_id
    fill_in "Rueda", with: @participante.rueda_id
    click_on "Update Participante"

    assert_text "Participante was successfully updated"
    click_on "Back"
  end

  test "destroying a Participante" do
    visit participantes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participante was successfully destroyed"
  end
end
