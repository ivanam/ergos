require 'test_helper'

class PersonaPuntoVentaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @persona_punto_ventum = persona_punto_venta(:one)
  end

  test "should get index" do
    get persona_punto_venta_url
    assert_response :success
  end

  test "should get new" do
    get new_persona_punto_ventum_url
    assert_response :success
  end

  test "should create persona_punto_ventum" do
    assert_difference('PersonaPuntoVentum.count') do
      post persona_punto_venta_url, params: { persona_punto_ventum: { persona_id: @persona_punto_ventum.persona_id, punto_venta_id: @persona_punto_ventum.punto_venta_id } }
    end

    assert_redirected_to persona_punto_ventum_url(PersonaPuntoVentum.last)
  end

  test "should show persona_punto_ventum" do
    get persona_punto_ventum_url(@persona_punto_ventum)
    assert_response :success
  end

  test "should get edit" do
    get edit_persona_punto_ventum_url(@persona_punto_ventum)
    assert_response :success
  end

  test "should update persona_punto_ventum" do
    patch persona_punto_ventum_url(@persona_punto_ventum), params: { persona_punto_ventum: { persona_id: @persona_punto_ventum.persona_id, punto_venta_id: @persona_punto_ventum.punto_venta_id } }
    assert_redirected_to persona_punto_ventum_url(@persona_punto_ventum)
  end

  test "should destroy persona_punto_ventum" do
    assert_difference('PersonaPuntoVentum.count', -1) do
      delete persona_punto_ventum_url(@persona_punto_ventum)
    end

    assert_redirected_to persona_punto_venta_url
  end
end
