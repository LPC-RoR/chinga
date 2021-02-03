require 'test_helper'

class UltimasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ultima = ultimas(:one)
  end

  test "should get index" do
    get ultimas_url
    assert_response :success
  end

  test "should get new" do
    get new_ultima_url
    assert_response :success
  end

  test "should create ultima" do
    assert_difference('Ultima.count') do
      post ultimas_url, params: { ultima: { sha1: @ultima.sha1, ultima: @ultima.ultima } }
    end

    assert_redirected_to ultima_url(Ultima.last)
  end

  test "should show ultima" do
    get ultima_url(@ultima)
    assert_response :success
  end

  test "should get edit" do
    get edit_ultima_url(@ultima)
    assert_response :success
  end

  test "should update ultima" do
    patch ultima_url(@ultima), params: { ultima: { sha1: @ultima.sha1, ultima: @ultima.ultima } }
    assert_redirected_to ultima_url(@ultima)
  end

  test "should destroy ultima" do
    assert_difference('Ultima.count', -1) do
      delete ultima_url(@ultima)
    end

    assert_redirected_to ultimas_url
  end
end
