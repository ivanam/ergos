require 'test_helper'

class ObjetivoSemanalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @objetivo_semanal = objetivo_semanals(:one)
  end

  test "should get index" do
    get objetivo_semanals_url
    assert_response :success
  end

  test "should get new" do
    get new_objetivo_semanal_url
    assert_response :success
  end

  test "should create objetivo_semanal" do
    assert_difference('ObjetivoSemanal.count') do
      post objetivo_semanals_url, params: { objetivo_semanal: { cantidad_propuesta: @objetivo_semanal.cantidad_propuesta, fecha_creacion: @objetivo_semanal.fecha_creacion, numero_semana: @objetivo_semanal.numero_semana, objetivo_mensual_id: @objetivo_semanal.objetivo_mensual_id, punto_venta_id: @objetivo_semanal.punto_venta_id, user_id: @objetivo_semanal.user_id, vendedor_id: @objetivo_semanal.vendedor_id } }
    end

    assert_redirected_to objetivo_semanal_url(ObjetivoSemanal.last)
  end

  test "should show objetivo_semanal" do
    get objetivo_semanal_url(@objetivo_semanal)
    assert_response :success
  end

  test "should get edit" do
    get edit_objetivo_semanal_url(@objetivo_semanal)
    assert_response :success
  end

  test "should update objetivo_semanal" do
    patch objetivo_semanal_url(@objetivo_semanal), params: { objetivo_semanal: { cantidad_propuesta: @objetivo_semanal.cantidad_propuesta, fecha_creacion: @objetivo_semanal.fecha_creacion, numero_semana: @objetivo_semanal.numero_semana, objetivo_mensual_id: @objetivo_semanal.objetivo_mensual_id, punto_venta_id: @objetivo_semanal.punto_venta_id, user_id: @objetivo_semanal.user_id, vendedor_id: @objetivo_semanal.vendedor_id } }
    assert_redirected_to objetivo_semanal_url(@objetivo_semanal)
  end

  test "should destroy objetivo_semanal" do
    assert_difference('ObjetivoSemanal.count', -1) do
      delete objetivo_semanal_url(@objetivo_semanal)
    end

    assert_redirected_to objetivo_semanals_url
  end
end
