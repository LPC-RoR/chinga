require 'test_helper'

class EstructuraPoeticasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estructura_poetica = estructura_poeticas(:one)
  end

  test "should get index" do
    get estructura_poeticas_url
    assert_response :success
  end

  test "should get new" do
    get new_estructura_poetica_url
    assert_response :success
  end

  test "should create estructura_poetica" do
    assert_difference('EstructuraPoetica.count') do
      post estructura_poeticas_url, params: { estructura_poetica: { estructura_poetica: @estructura_poetica.estructura_poetica, owner_id: @estructura_poetica.owner_id } }
    end

    assert_redirected_to estructura_poetica_url(EstructuraPoetica.last)
  end

  test "should show estructura_poetica" do
    get estructura_poetica_url(@estructura_poetica)
    assert_response :success
  end

  test "should get edit" do
    get edit_estructura_poetica_url(@estructura_poetica)
    assert_response :success
  end

  test "should update estructura_poetica" do
    patch estructura_poetica_url(@estructura_poetica), params: { estructura_poetica: { estructura_poetica: @estructura_poetica.estructura_poetica, owner_id: @estructura_poetica.owner_id } }
    assert_redirected_to estructura_poetica_url(@estructura_poetica)
  end

  test "should destroy estructura_poetica" do
    assert_difference('EstructuraPoetica.count', -1) do
      delete estructura_poetica_url(@estructura_poetica)
    end

    assert_redirected_to estructura_poeticas_url
  end
end
