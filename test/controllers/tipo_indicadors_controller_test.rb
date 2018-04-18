require 'test_helper'

class TipoIndicadorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_indicador = tipo_indicadors(:one)
  end

  test "should get index" do
    get tipo_indicadors_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_indicador_url
    assert_response :success
  end

  test "should create tipo_indicador" do
    assert_difference('TipoIndicador.count') do
      post tipo_indicadors_url, params: { tipo_indicador: { descripcion: @tipo_indicador.descripcion } }
    end

    assert_redirected_to tipo_indicador_url(TipoIndicador.last)
  end

  test "should show tipo_indicador" do
    get tipo_indicador_url(@tipo_indicador)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_indicador_url(@tipo_indicador)
    assert_response :success
  end

  test "should update tipo_indicador" do
    patch tipo_indicador_url(@tipo_indicador), params: { tipo_indicador: { descripcion: @tipo_indicador.descripcion } }
    assert_redirected_to tipo_indicador_url(@tipo_indicador)
  end

  test "should destroy tipo_indicador" do
    assert_difference('TipoIndicador.count', -1) do
      delete tipo_indicador_url(@tipo_indicador)
    end

    assert_redirected_to tipo_indicadors_url
  end
end
