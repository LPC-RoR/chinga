require 'test_helper'

class ClavesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clave = claves(:one)
  end

  test "should get index" do
    get claves_url
    assert_response :success
  end

  test "should get new" do
    get new_clave_url
    assert_response :success
  end

  test "should create clave" do
    assert_difference('Clave.count') do
      post claves_url, params: { clave: { clave: @clave.clave, orden: @clave.orden, sha1: @clave.sha1 } }
    end

    assert_redirected_to clave_url(Clave.last)
  end

  test "should show clave" do
    get clave_url(@clave)
    assert_response :success
  end

  test "should get edit" do
    get edit_clave_url(@clave)
    assert_response :success
  end

  test "should update clave" do
    patch clave_url(@clave), params: { clave: { clave: @clave.clave, orden: @clave.orden, sha1: @clave.sha1 } }
    assert_redirected_to clave_url(@clave)
  end

  test "should destroy clave" do
    assert_difference('Clave.count', -1) do
      delete clave_url(@clave)
    end

    assert_redirected_to claves_url
  end
end
