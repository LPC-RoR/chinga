require 'test_helper'

class TipoSoportesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_soporte = tipo_soportes(:one)
  end

  test "should get index" do
    get tipo_soportes_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_soporte_url
    assert_response :success
  end

  test "should create tipo_soporte" do
    assert_difference('TipoSoporte.count') do
      post tipo_soportes_url, params: { tipo_soporte: { tipo_soporte: @tipo_soporte.tipo_soporte } }
    end

    assert_redirected_to tipo_soporte_url(TipoSoporte.last)
  end

  test "should show tipo_soporte" do
    get tipo_soporte_url(@tipo_soporte)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_soporte_url(@tipo_soporte)
    assert_response :success
  end

  test "should update tipo_soporte" do
    patch tipo_soporte_url(@tipo_soporte), params: { tipo_soporte: { tipo_soporte: @tipo_soporte.tipo_soporte } }
    assert_redirected_to tipo_soporte_url(@tipo_soporte)
  end

  test "should destroy tipo_soporte" do
    assert_difference('TipoSoporte.count', -1) do
      delete tipo_soporte_url(@tipo_soporte)
    end

    assert_redirected_to tipo_soportes_url
  end
end
