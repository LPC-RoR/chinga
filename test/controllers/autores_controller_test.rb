require 'test_helper'

class AutoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @autor = autores(:one)
  end

  test "should get index" do
    get autores_url
    assert_response :success
  end

  test "should get new" do
    get new_autor_url
    assert_response :success
  end

  test "should create autor" do
    assert_difference('Autor.count') do
      post autores_url, params: { autor: { autor: @autor.autor, perfil_id: @autor.perfil_id } }
    end

    assert_redirected_to autor_url(Autor.last)
  end

  test "should show autor" do
    get autor_url(@autor)
    assert_response :success
  end

  test "should get edit" do
    get edit_autor_url(@autor)
    assert_response :success
  end

  test "should update autor" do
    patch autor_url(@autor), params: { autor: { autor: @autor.autor, perfil_id: @autor.perfil_id } }
    assert_redirected_to autor_url(@autor)
  end

  test "should destroy autor" do
    assert_difference('Autor.count', -1) do
      delete autor_url(@autor)
    end

    assert_redirected_to autores_url
  end
end
