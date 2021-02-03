require 'test_helper'

class ElementosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @elemento = elementos(:one)
  end

  test "should get index" do
    get elementos_url
    assert_response :success
  end

  test "should get new" do
    get new_elemento_url
    assert_response :success
  end

  test "should create elemento" do
    assert_difference('Elemento.count') do
      post elementos_url, params: { elemento: { annio_creacion: @elemento.annio_creacion, annio_estreno: @elemento.annio_estreno, autor: @elemento.autor, ciudad_autor: @elemento.ciudad_autor, disco: @elemento.disco, forma_musical: @elemento.forma_musical, genero: @elemento.genero, interprete: @elemento.interprete, letra: @elemento.letra, link: @elemento.link, otro_soporte: @elemento.otro_soporte, pais: @elemento.pais, titulo: @elemento.titulo } }
    end

    assert_redirected_to elemento_url(Elemento.last)
  end

  test "should show elemento" do
    get elemento_url(@elemento)
    assert_response :success
  end

  test "should get edit" do
    get edit_elemento_url(@elemento)
    assert_response :success
  end

  test "should update elemento" do
    patch elemento_url(@elemento), params: { elemento: { annio_creacion: @elemento.annio_creacion, annio_estreno: @elemento.annio_estreno, autor: @elemento.autor, ciudad_autor: @elemento.ciudad_autor, disco: @elemento.disco, forma_musical: @elemento.forma_musical, genero: @elemento.genero, interprete: @elemento.interprete, letra: @elemento.letra, link: @elemento.link, otro_soporte: @elemento.otro_soporte, pais: @elemento.pais, titulo: @elemento.titulo } }
    assert_redirected_to elemento_url(@elemento)
  end

  test "should destroy elemento" do
    assert_difference('Elemento.count', -1) do
      delete elemento_url(@elemento)
    end

    assert_redirected_to elementos_url
  end
end
