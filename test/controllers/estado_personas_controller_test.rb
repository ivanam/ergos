require 'test_helper'

class EstadoPersonasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estado_persona = estado_personas(:one)
  end

  test "should get index" do
    get estado_personas_url
    assert_response :success
  end

  test "should get new" do
    get new_estado_persona_url
    assert_response :success
  end

  test "should create estado_persona" do
    assert_difference('EstadoPersona.count') do
      post estado_personas_url, params: { estado_persona: { estado: @estado_persona.estado, fecha_fin: @estado_persona.fecha_fin, fecha_inicio: @estado_persona.fecha_inicio, persona_id: @estado_persona.persona_id, persona_id: @estado_persona.persona_id } }
    end

    assert_redirected_to estado_persona_url(EstadoPersona.last)
  end

  test "should show estado_persona" do
    get estado_persona_url(@estado_persona)
    assert_response :success
  end

  test "should get edit" do
    get edit_estado_persona_url(@estado_persona)
    assert_response :success
  end

  test "should update estado_persona" do
    patch estado_persona_url(@estado_persona), params: { estado_persona: { estado: @estado_persona.estado, fecha_fin: @estado_persona.fecha_fin, fecha_inicio: @estado_persona.fecha_inicio, persona_id: @estado_persona.persona_id, persona_id: @estado_persona.persona_id } }
    assert_redirected_to estado_persona_url(@estado_persona)
  end

  test "should destroy estado_persona" do
    assert_difference('EstadoPersona.count', -1) do
      delete estado_persona_url(@estado_persona)
    end

    assert_redirected_to estado_personas_url
  end
end
