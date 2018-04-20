require 'test_helper'

class ObjetivoMensualsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @objetivo_mensual = objetivo_mensuals(:one)
  end

  test "should get index" do
    get objetivo_mensuals_url
    assert_response :success
  end

  test "should get new" do
    get new_objetivo_mensual_url
    assert_response :success
  end

  test "should create objetivo_mensual" do
    assert_difference('ObjetivoMensual.count') do
      post objetivo_mensuals_url, params: { objetivo_mensual: { anio: @objetivo_mensual.anio, cantidad_propuesta: @objetivo_mensual.cantidad_propuesta, descripcion: @objetivo_mensual.descripcion, fecha_creacion: @objetivo_mensual.fecha_creacion, mes: @objetivo_mensual.mes, punto_venta_id: @objetivo_mensual.punto_venta_id, tipo_objetivo_id: @objetivo_mensual.tipo_objetivo_id, user_id: @objetivo_mensual.user_id, vendedor_id: @objetivo_mensual.vendedor_id } }
    end

    assert_redirected_to objetivo_mensual_url(ObjetivoMensual.last)
  end

  test "should show objetivo_mensual" do
    get objetivo_mensual_url(@objetivo_mensual)
    assert_response :success
  end

  test "should get edit" do
    get edit_objetivo_mensual_url(@objetivo_mensual)
    assert_response :success
  end

  test "should update objetivo_mensual" do
    patch objetivo_mensual_url(@objetivo_mensual), params: { objetivo_mensual: { anio: @objetivo_mensual.anio, cantidad_propuesta: @objetivo_mensual.cantidad_propuesta, descripcion: @objetivo_mensual.descripcion, fecha_creacion: @objetivo_mensual.fecha_creacion, mes: @objetivo_mensual.mes, punto_venta_id: @objetivo_mensual.punto_venta_id, tipo_objetivo_id: @objetivo_mensual.tipo_objetivo_id, user_id: @objetivo_mensual.user_id, vendedor_id: @objetivo_mensual.vendedor_id } }
    assert_redirected_to objetivo_mensual_url(@objetivo_mensual)
  end

  test "should destroy objetivo_mensual" do
    assert_difference('ObjetivoMensual.count', -1) do
      delete objetivo_mensual_url(@objetivo_mensual)
    end

    assert_redirected_to objetivo_mensuals_url
  end
end
