require 'test_helper'

class ListasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lista = listas(:one)
  end

  test "should get index" do
    get listas_url
    assert_response :success
  end

  test "should get new" do
    get new_lista_url
    assert_response :success
  end

  test "should create lista" do
    assert_difference('Lista.count') do
      post listas_url, params: { lista: { lista: @lista.lista, perfil_id: @lista.perfil_id } }
    end

    assert_redirected_to lista_url(Lista.last)
  end

  test "should show lista" do
    get lista_url(@lista)
    assert_response :success
  end

  test "should get edit" do
    get edit_lista_url(@lista)
    assert_response :success
  end

  test "should update lista" do
    patch lista_url(@lista), params: { lista: { lista: @lista.lista, perfil_id: @lista.perfil_id } }
    assert_redirected_to lista_url(@lista)
  end

  test "should destroy lista" do
    assert_difference('Lista.count', -1) do
      delete lista_url(@lista)
    end

    assert_redirected_to listas_url
  end
end
