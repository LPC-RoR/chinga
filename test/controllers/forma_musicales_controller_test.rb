require 'test_helper'

class FormaMusicalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forma_musical = forma_musicales(:one)
  end

  test "should get index" do
    get forma_musicales_url
    assert_response :success
  end

  test "should get new" do
    get new_forma_musical_url
    assert_response :success
  end

  test "should create forma_musical" do
    assert_difference('FormaMusical.count') do
      post forma_musicales_url, params: { forma_musical: { forma_musical: @forma_musical.forma_musical, owner_id: @forma_musical.owner_id } }
    end

    assert_redirected_to forma_musical_url(FormaMusical.last)
  end

  test "should show forma_musical" do
    get forma_musical_url(@forma_musical)
    assert_response :success
  end

  test "should get edit" do
    get edit_forma_musical_url(@forma_musical)
    assert_response :success
  end

  test "should update forma_musical" do
    patch forma_musical_url(@forma_musical), params: { forma_musical: { forma_musical: @forma_musical.forma_musical, owner_id: @forma_musical.owner_id } }
    assert_redirected_to forma_musical_url(@forma_musical)
  end

  test "should destroy forma_musical" do
    assert_difference('FormaMusical.count', -1) do
      delete forma_musical_url(@forma_musical)
    end

    assert_redirected_to forma_musicales_url
  end
end
