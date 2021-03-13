require 'test_helper'

class CreacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creacion = creaciones(:one)
  end

  test "should get index" do
    get creaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_creacion_url
    assert_response :success
  end

  test "should create creacion" do
    assert_difference('Creacion.count') do
      post creaciones_url, params: { creacion: { autor_id: @creacion.autor_id, elemento_id: @creacion.elemento_id } }
    end

    assert_redirected_to creacion_url(Creacion.last)
  end

  test "should show creacion" do
    get creacion_url(@creacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_creacion_url(@creacion)
    assert_response :success
  end

  test "should update creacion" do
    patch creacion_url(@creacion), params: { creacion: { autor_id: @creacion.autor_id, elemento_id: @creacion.elemento_id } }
    assert_redirected_to creacion_url(@creacion)
  end

  test "should destroy creacion" do
    assert_difference('Creacion.count', -1) do
      delete creacion_url(@creacion)
    end

    assert_redirected_to creaciones_url
  end
end
