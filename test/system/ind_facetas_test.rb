require "application_system_test_case"

class IndFacetasTest < ApplicationSystemTestCase
  setup do
    @ind_faceta = ind_facetas(:one)
  end

  test "visiting the index" do
    visit ind_facetas_url
    assert_selector "h1", text: "Ind Facetas"
  end

  test "creating a Ind faceta" do
    visit ind_facetas_url
    click_on "New Ind Faceta"

    fill_in "Faceta", with: @ind_faceta.faceta
    fill_in "Ind estructura", with: @ind_faceta.ind_estructura_id
    fill_in "Ind faceta", with: @ind_faceta.ind_faceta
    click_on "Create Ind faceta"

    assert_text "Ind faceta was successfully created"
    click_on "Back"
  end

  test "updating a Ind faceta" do
    visit ind_facetas_url
    click_on "Edit", match: :first

    fill_in "Faceta", with: @ind_faceta.faceta
    fill_in "Ind estructura", with: @ind_faceta.ind_estructura_id
    fill_in "Ind faceta", with: @ind_faceta.ind_faceta
    click_on "Update Ind faceta"

    assert_text "Ind faceta was successfully updated"
    click_on "Back"
  end

  test "destroying a Ind faceta" do
    visit ind_facetas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ind faceta was successfully destroyed"
  end
end
