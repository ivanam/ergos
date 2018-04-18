require 'test_helper'

class UserPuntoVentaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_punto_ventum = user_punto_venta(:one)
  end

  test "should get index" do
    get user_punto_venta_url
    assert_response :success
  end

  test "should get new" do
    get new_user_punto_ventum_url
    assert_response :success
  end

  test "should create user_punto_ventum" do
    assert_difference('UserPuntoVentum.count') do
      post user_punto_venta_url, params: { user_punto_ventum: { punto_venta_id: @user_punto_ventum.punto_venta_id, user_id: @user_punto_ventum.user_id } }
    end

    assert_redirected_to user_punto_ventum_url(UserPuntoVentum.last)
  end

  test "should show user_punto_ventum" do
    get user_punto_ventum_url(@user_punto_ventum)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_punto_ventum_url(@user_punto_ventum)
    assert_response :success
  end

  test "should update user_punto_ventum" do
    patch user_punto_ventum_url(@user_punto_ventum), params: { user_punto_ventum: { punto_venta_id: @user_punto_ventum.punto_venta_id, user_id: @user_punto_ventum.user_id } }
    assert_redirected_to user_punto_ventum_url(@user_punto_ventum)
  end

  test "should destroy user_punto_ventum" do
    assert_difference('UserPuntoVentum.count', -1) do
      delete user_punto_ventum_url(@user_punto_ventum)
    end

    assert_redirected_to user_punto_venta_url
  end
end
