require 'test_helper'

class ChofersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chofer = chofers(:one)
  end

  test "should get index" do
    get chofers_url
    assert_response :success
  end

  test "should get new" do
    get new_chofer_url
    assert_response :success
  end

  test "should create chofer" do
    assert_difference('Chofer.count') do
      post chofers_url, params: { chofer: { apellidos: @chofer.apellidos, experiencia: @chofer.experiencia, fechaNacimiento: @chofer.fechaNacimiento, nombres: @chofer.nombres, tipoLicencia: @chofer.tipoLicencia } }
    end

    assert_redirected_to chofer_url(Chofer.last)
  end

  test "should show chofer" do
    get chofer_url(@chofer)
    assert_response :success
  end

  test "should get edit" do
    get edit_chofer_url(@chofer)
    assert_response :success
  end

  test "should update chofer" do
    patch chofer_url(@chofer), params: { chofer: { apellidos: @chofer.apellidos, experiencia: @chofer.experiencia, fechaNacimiento: @chofer.fechaNacimiento, nombres: @chofer.nombres, tipoLicencia: @chofer.tipoLicencia } }
    assert_redirected_to chofer_url(@chofer)
  end

  test "should destroy chofer" do
    assert_difference('Chofer.count', -1) do
      delete chofer_url(@chofer)
    end

    assert_redirected_to chofers_url
  end
end
