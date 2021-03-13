require 'test_helper'

class SoportesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @soporte = soportes(:one)
  end

  test "should get index" do
    get soportes_url
    assert_response :success
  end

  test "should get new" do
    get new_soporte_url
    assert_response :success
  end

  test "should create soporte" do
    assert_difference('Soporte.count') do
      post soportes_url, params: { soporte: { anio: @soporte.anio, soporte: @soporte.soporte, tipo: @soporte.tipo } }
    end

    assert_redirected_to soporte_url(Soporte.last)
  end

  test "should show soporte" do
    get soporte_url(@soporte)
    assert_response :success
  end

  test "should get edit" do
    get edit_soporte_url(@soporte)
    assert_response :success
  end

  test "should update soporte" do
    patch soporte_url(@soporte), params: { soporte: { anio: @soporte.anio, soporte: @soporte.soporte, tipo: @soporte.tipo } }
    assert_redirected_to soporte_url(@soporte)
  end

  test "should destroy soporte" do
    assert_difference('Soporte.count', -1) do
      delete soporte_url(@soporte)
    end

    assert_redirected_to soportes_url
  end
end
