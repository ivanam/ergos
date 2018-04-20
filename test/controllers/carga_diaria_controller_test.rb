require 'test_helper'

class CargaDiariaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carga_diarium = carga_diaria(:one)
  end

  test "should get index" do
    get carga_diaria_url
    assert_response :success
  end

  test "should get new" do
    get new_carga_diarium_url
    assert_response :success
  end

  test "should create carga_diarium" do
    assert_difference('CargaDiarium.count') do
      post carga_diaria_url, params: { carga_diarium: { cantidad: @carga_diarium.cantidad, fecha: @carga_diarium.fecha, tipo_objetivo_id: @carga_diarium.tipo_objetivo_id, vendedor_id: @carga_diarium.vendedor_id } }
    end

    assert_redirected_to carga_diarium_url(CargaDiarium.last)
  end

  test "should show carga_diarium" do
    get carga_diarium_url(@carga_diarium)
    assert_response :success
  end

  test "should get edit" do
    get edit_carga_diarium_url(@carga_diarium)
    assert_response :success
  end

  test "should update carga_diarium" do
    patch carga_diarium_url(@carga_diarium), params: { carga_diarium: { cantidad: @carga_diarium.cantidad, fecha: @carga_diarium.fecha, tipo_objetivo_id: @carga_diarium.tipo_objetivo_id, vendedor_id: @carga_diarium.vendedor_id } }
    assert_redirected_to carga_diarium_url(@carga_diarium)
  end

  test "should destroy carga_diarium" do
    assert_difference('CargaDiarium.count', -1) do
      delete carga_diarium_url(@carga_diarium)
    end

    assert_redirected_to carga_diaria_url
  end
end
