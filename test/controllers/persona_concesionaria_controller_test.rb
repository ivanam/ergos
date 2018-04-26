require 'test_helper'

class PersonaConcesionariaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @persona_concesionarium = persona_concesionaria(:one)
  end

  test "should get index" do
    get persona_concesionaria_url
    assert_response :success
  end

  test "should get new" do
    get new_persona_concesionarium_url
    assert_response :success
  end

  test "should create persona_concesionarium" do
    assert_difference('PersonaConcesionarium.count') do
      post persona_concesionaria_url, params: { persona_concesionarium: { concesionaria_id: @persona_concesionarium.concesionaria_id, persona_id: @persona_concesionarium.persona_id } }
    end

    assert_redirected_to persona_concesionarium_url(PersonaConcesionarium.last)
  end

  test "should show persona_concesionarium" do
    get persona_concesionarium_url(@persona_concesionarium)
    assert_response :success
  end

  test "should get edit" do
    get edit_persona_concesionarium_url(@persona_concesionarium)
    assert_response :success
  end

  test "should update persona_concesionarium" do
    patch persona_concesionarium_url(@persona_concesionarium), params: { persona_concesionarium: { concesionaria_id: @persona_concesionarium.concesionaria_id, persona_id: @persona_concesionarium.persona_id } }
    assert_redirected_to persona_concesionarium_url(@persona_concesionarium)
  end

  test "should destroy persona_concesionarium" do
    assert_difference('PersonaConcesionarium.count', -1) do
      delete persona_concesionarium_url(@persona_concesionarium)
    end

    assert_redirected_to persona_concesionaria_url
  end
end
