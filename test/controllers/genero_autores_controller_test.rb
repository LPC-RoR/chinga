require 'test_helper'

class GeneroAutoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @genero_autor = genero_autores(:one)
  end

  test "should get index" do
    get genero_autores_url
    assert_response :success
  end

  test "should get new" do
    get new_genero_autor_url
    assert_response :success
  end

  test "should create genero_autor" do
    assert_difference('GeneroAutor.count') do
      post genero_autores_url, params: { genero_autor: { genero_autor: @genero_autor.genero_autor, owner_id: @genero_autor.owner_id } }
    end

    assert_redirected_to genero_autor_url(GeneroAutor.last)
  end

  test "should show genero_autor" do
    get genero_autor_url(@genero_autor)
    assert_response :success
  end

  test "should get edit" do
    get edit_genero_autor_url(@genero_autor)
    assert_response :success
  end

  test "should update genero_autor" do
    patch genero_autor_url(@genero_autor), params: { genero_autor: { genero_autor: @genero_autor.genero_autor, owner_id: @genero_autor.owner_id } }
    assert_redirected_to genero_autor_url(@genero_autor)
  end

  test "should destroy genero_autor" do
    assert_difference('GeneroAutor.count', -1) do
      delete genero_autor_url(@genero_autor)
    end

    assert_redirected_to genero_autores_url
  end
end
