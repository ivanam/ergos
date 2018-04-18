require 'test_helper'

class IndicadorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @indicador = indicadors(:one)
  end

  test "should get index" do
    get indicadors_url
    assert_response :success
  end

  test "should get new" do
    get new_indicador_url
    assert_response :success
  end

  test "should create indicador" do
    assert_difference('Indicador.count') do
      post indicadors_url, params: { indicador: { cantidad_completa: @indicador.cantidad_completa, fecha: @indicador.fecha, tipo_indicador_id: @indicador.tipo_indicador_id } }
    end

    assert_redirected_to indicador_url(Indicador.last)
  end

  test "should show indicador" do
    get indicador_url(@indicador)
    assert_response :success
  end

  test "should get edit" do
    get edit_indicador_url(@indicador)
    assert_response :success
  end

  test "should update indicador" do
    patch indicador_url(@indicador), params: { indicador: { cantidad_completa: @indicador.cantidad_completa, fecha: @indicador.fecha, tipo_indicador_id: @indicador.tipo_indicador_id } }
    assert_redirected_to indicador_url(@indicador)
  end

  test "should destroy indicador" do
    assert_difference('Indicador.count', -1) do
      delete indicador_url(@indicador)
    end

    assert_redirected_to indicadors_url
  end
end
