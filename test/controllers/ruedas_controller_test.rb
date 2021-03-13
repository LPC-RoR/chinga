require 'test_helper'

class RuedasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rueda = ruedas(:one)
  end

  test "should get index" do
    get ruedas_url
    assert_response :success
  end

  test "should get new" do
    get new_rueda_url
    assert_response :success
  end

  test "should create rueda" do
    assert_difference('Rueda.count') do
      post ruedas_url, params: { rueda: { administrador_id: @rueda.administrador_id, invitacion: @rueda.invitacion, rueda: @rueda.rueda, ubicacion: @rueda.ubicacion } }
    end

    assert_redirected_to rueda_url(Rueda.last)
  end

  test "should show rueda" do
    get rueda_url(@rueda)
    assert_response :success
  end

  test "should get edit" do
    get edit_rueda_url(@rueda)
    assert_response :success
  end

  test "should update rueda" do
    patch rueda_url(@rueda), params: { rueda: { administrador_id: @rueda.administrador_id, invitacion: @rueda.invitacion, rueda: @rueda.rueda, ubicacion: @rueda.ubicacion } }
    assert_redirected_to rueda_url(@rueda)
  end

  test "should destroy rueda" do
    assert_difference('Rueda.count', -1) do
      delete rueda_url(@rueda)
    end

    assert_redirected_to ruedas_url
  end
end
