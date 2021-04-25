require 'test_helper'

class EstrofasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estrofa = estrofas(:one)
  end

  test "should get index" do
    get estrofas_url
    assert_response :success
  end

  test "should get new" do
    get new_estrofa_url
    assert_response :success
  end

  test "should create estrofa" do
    assert_difference('Estrofa.count') do
      post estrofas_url, params: { estrofa: { n_estrofa: @estrofa.n_estrofa } }
    end

    assert_redirected_to estrofa_url(Estrofa.last)
  end

  test "should show estrofa" do
    get estrofa_url(@estrofa)
    assert_response :success
  end

  test "should get edit" do
    get edit_estrofa_url(@estrofa)
    assert_response :success
  end

  test "should update estrofa" do
    patch estrofa_url(@estrofa), params: { estrofa: { n_estrofa: @estrofa.n_estrofa } }
    assert_redirected_to estrofa_url(@estrofa)
  end

  test "should destroy estrofa" do
    assert_difference('Estrofa.count', -1) do
      delete estrofa_url(@estrofa)
    end

    assert_redirected_to estrofas_url
  end
end
