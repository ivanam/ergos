require 'test_helper'

class TipoObjetivosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_objetivo = tipo_objetivos(:one)
  end

  test "should get index" do
    get tipo_objetivos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_objetivo_url
    assert_response :success
  end

  test "should create tipo_objetivo" do
    assert_difference('TipoObjetivo.count') do
      post tipo_objetivos_url, params: { tipo_objetivo: { descripcion: @tipo_objetivo.descripcion } }
    end

    assert_redirected_to tipo_objetivo_url(TipoObjetivo.last)
  end

  test "should show tipo_objetivo" do
    get tipo_objetivo_url(@tipo_objetivo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_objetivo_url(@tipo_objetivo)
    assert_response :success
  end

  test "should update tipo_objetivo" do
    patch tipo_objetivo_url(@tipo_objetivo), params: { tipo_objetivo: { descripcion: @tipo_objetivo.descripcion } }
    assert_redirected_to tipo_objetivo_url(@tipo_objetivo)
  end

  test "should destroy tipo_objetivo" do
    assert_difference('TipoObjetivo.count', -1) do
      delete tipo_objetivo_url(@tipo_objetivo)
    end

    assert_redirected_to tipo_objetivos_url
  end
end
