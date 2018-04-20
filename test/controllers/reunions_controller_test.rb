require 'test_helper'

class ReunionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reunion = reunions(:one)
  end

  test "should get index" do
    get reunions_url
    assert_response :success
  end

  test "should get new" do
    get new_reunion_url
    assert_response :success
  end

  test "should create reunion" do
    assert_difference('Reunion.count') do
      post reunions_url, params: { reunion: { fecha: @reunion.fecha, lugar_fisico: @reunion.lugar_fisico, persona_id: @reunion.persona_id, semana: @reunion.semana } }
    end

    assert_redirected_to reunion_url(Reunion.last)
  end

  test "should show reunion" do
    get reunion_url(@reunion)
    assert_response :success
  end

  test "should get edit" do
    get edit_reunion_url(@reunion)
    assert_response :success
  end

  test "should update reunion" do
    patch reunion_url(@reunion), params: { reunion: { fecha: @reunion.fecha, lugar_fisico: @reunion.lugar_fisico, persona_id: @reunion.persona_id, semana: @reunion.semana } }
    assert_redirected_to reunion_url(@reunion)
  end

  test "should destroy reunion" do
    assert_difference('Reunion.count', -1) do
      delete reunion_url(@reunion)
    end

    assert_redirected_to reunions_url
  end
end
