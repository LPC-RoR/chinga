require 'test_helper'

class IndFacetasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ind_faceta = ind_facetas(:one)
  end

  test "should get index" do
    get ind_facetas_url
    assert_response :success
  end

  test "should get new" do
    get new_ind_faceta_url
    assert_response :success
  end

  test "should create ind_faceta" do
    assert_difference('IndFaceta.count') do
      post ind_facetas_url, params: { ind_faceta: { faceta: @ind_faceta.faceta, ind_estructura_id: @ind_faceta.ind_estructura_id, ind_faceta: @ind_faceta.ind_faceta } }
    end

    assert_redirected_to ind_faceta_url(IndFaceta.last)
  end

  test "should show ind_faceta" do
    get ind_faceta_url(@ind_faceta)
    assert_response :success
  end

  test "should get edit" do
    get edit_ind_faceta_url(@ind_faceta)
    assert_response :success
  end

  test "should update ind_faceta" do
    patch ind_faceta_url(@ind_faceta), params: { ind_faceta: { faceta: @ind_faceta.faceta, ind_estructura_id: @ind_faceta.ind_estructura_id, ind_faceta: @ind_faceta.ind_faceta } }
    assert_redirected_to ind_faceta_url(@ind_faceta)
  end

  test "should destroy ind_faceta" do
    assert_difference('IndFaceta.count', -1) do
      delete ind_faceta_url(@ind_faceta)
    end

    assert_redirected_to ind_facetas_url
  end
end
