require 'test_helper'

class ConcesionariaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @concesionarium = concesionaria(:one)
  end

  test "should get index" do
    get concesionaria_url
    assert_response :success
  end

  test "should get new" do
    get new_concesionarium_url
    assert_response :success
  end

  test "should create concesionarium" do
    assert_difference('Concesionarium.count') do
      post concesionaria_url, params: { concesionarium: { empresa_id: @concesionarium.empresa_id, fecha_alta: @concesionarium.fecha_alta, fecha_baja: @concesionarium.fecha_baja, icono: @concesionarium.icono, nombre: @concesionarium.nombre, user_id: @concesionarium.user_id } }
    end

    assert_redirected_to concesionarium_url(Concesionarium.last)
  end

  test "should show concesionarium" do
    get concesionarium_url(@concesionarium)
    assert_response :success
  end

  test "should get edit" do
    get edit_concesionarium_url(@concesionarium)
    assert_response :success
  end

  test "should update concesionarium" do
    patch concesionarium_url(@concesionarium), params: { concesionarium: { empresa_id: @concesionarium.empresa_id, fecha_alta: @concesionarium.fecha_alta, fecha_baja: @concesionarium.fecha_baja, icono: @concesionarium.icono, nombre: @concesionarium.nombre, user_id: @concesionarium.user_id } }
    assert_redirected_to concesionarium_url(@concesionarium)
  end

  test "should destroy concesionarium" do
    assert_difference('Concesionarium.count', -1) do
      delete concesionarium_url(@concesionarium)
    end

    assert_redirected_to concesionaria_url
  end
end
