require 'test_helper'

class InterpretesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interprete = interpretes(:one)
  end

  test "should get index" do
    get interpretes_url
    assert_response :success
  end

  test "should get new" do
    get new_interprete_url
    assert_response :success
  end

  test "should create interprete" do
    assert_difference('Interprete.count') do
      post interpretes_url, params: { interprete: { interprete: @interprete.interprete, perfil_id: @interprete.perfil_id } }
    end

    assert_redirected_to interprete_url(Interprete.last)
  end

  test "should show interprete" do
    get interprete_url(@interprete)
    assert_response :success
  end

  test "should get edit" do
    get edit_interprete_url(@interprete)
    assert_response :success
  end

  test "should update interprete" do
    patch interprete_url(@interprete), params: { interprete: { interprete: @interprete.interprete, perfil_id: @interprete.perfil_id } }
    assert_redirected_to interprete_url(@interprete)
  end

  test "should destroy interprete" do
    assert_difference('Interprete.count', -1) do
      delete interprete_url(@interprete)
    end

    assert_redirected_to interpretes_url
  end
end
