require 'test_helper'

class ReunionParticipantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reunion_participante = reunion_participantes(:one)
  end

  test "should get index" do
    get reunion_participantes_url
    assert_response :success
  end

  test "should get new" do
    get new_reunion_participante_url
    assert_response :success
  end

  test "should create reunion_participante" do
    assert_difference('ReunionParticipante.count') do
      post reunion_participantes_url, params: { reunion_participante: { reunion_id: @reunion_participante.reunion_id, user_id: @reunion_participante.user_id } }
    end

    assert_redirected_to reunion_participante_url(ReunionParticipante.last)
  end

  test "should show reunion_participante" do
    get reunion_participante_url(@reunion_participante)
    assert_response :success
  end

  test "should get edit" do
    get edit_reunion_participante_url(@reunion_participante)
    assert_response :success
  end

  test "should update reunion_participante" do
    patch reunion_participante_url(@reunion_participante), params: { reunion_participante: { reunion_id: @reunion_participante.reunion_id, user_id: @reunion_participante.user_id } }
    assert_redirected_to reunion_participante_url(@reunion_participante)
  end

  test "should destroy reunion_participante" do
    assert_difference('ReunionParticipante.count', -1) do
      delete reunion_participante_url(@reunion_participante)
    end

    assert_redirected_to reunion_participantes_url
  end
end
