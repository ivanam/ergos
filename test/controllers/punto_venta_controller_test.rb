require 'test_helper'

class PuntoVentaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @punto_ventum = punto_venta(:one)
  end

  test "should get index" do
    get punto_venta_url
    assert_response :success
  end

  test "should get new" do
    get new_punto_ventum_url
    assert_response :success
  end

  test "should create punto_ventum" do
    assert_difference('PuntoVentum.count') do
      post punto_venta_url, params: { punto_ventum: { concesionaria_id: @punto_ventum.concesionaria_id, domicilio: @punto_ventum.domicilio, nombre: @punto_ventum.nombre, persona_id: @punto_ventum.persona_id } }
    end

    assert_redirected_to punto_ventum_url(PuntoVentum.last)
  end

  test "should show punto_ventum" do
    get punto_ventum_url(@punto_ventum)
    assert_response :success
  end

  test "should get edit" do
    get edit_punto_ventum_url(@punto_ventum)
    assert_response :success
  end

  test "should update punto_ventum" do
    patch punto_ventum_url(@punto_ventum), params: { punto_ventum: { concesionaria_id: @punto_ventum.concesionaria_id, domicilio: @punto_ventum.domicilio, nombre: @punto_ventum.nombre, persona_id: @punto_ventum.persona_id } }
    assert_redirected_to punto_ventum_url(@punto_ventum)
  end

  test "should destroy punto_ventum" do
    assert_difference('PuntoVentum.count', -1) do
      delete punto_ventum_url(@punto_ventum)
    end

    assert_redirected_to punto_venta_url
  end
end
