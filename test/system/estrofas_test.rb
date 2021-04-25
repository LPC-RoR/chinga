require "application_system_test_case"

class EstrofasTest < ApplicationSystemTestCase
  setup do
    @estrofa = estrofas(:one)
  end

  test "visiting the index" do
    visit estrofas_url
    assert_selector "h1", text: "Estrofas"
  end

  test "creating a Estrofa" do
    visit estrofas_url
    click_on "New Estrofa"

    fill_in "N estrofa", with: @estrofa.n_estrofa
    click_on "Create Estrofa"

    assert_text "Estrofa was successfully created"
    click_on "Back"
  end

  test "updating a Estrofa" do
    visit estrofas_url
    click_on "Edit", match: :first

    fill_in "N estrofa", with: @estrofa.n_estrofa
    click_on "Update Estrofa"

    assert_text "Estrofa was successfully updated"
    click_on "Back"
  end

  test "destroying a Estrofa" do
    visit estrofas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estrofa was successfully destroyed"
  end
end
