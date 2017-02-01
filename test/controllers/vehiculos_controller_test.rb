require 'test_helper'

class VehiculosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehiculo = vehiculos(:one)
  end

  test "should get index" do
    get vehiculos_url
    assert_response :success
  end

  test "should get new" do
    get new_vehiculo_url
    assert_response :success
  end

  test "should create vehiculo" do
    assert_difference('Vehiculo.count') do
      post vehiculos_url, params: { vehiculo: { capacidadPasajeros: @vehiculo.capacidadPasajeros, color: @vehiculo.color, kilometraje: @vehiculo.kilometraje, marca: @vehiculo.marca, modelo: @vehiculo.modelo, observaciones: @vehiculo.observaciones } }
    end

    assert_redirected_to vehiculo_url(Vehiculo.last)
  end

  test "should show vehiculo" do
    get vehiculo_url(@vehiculo)
    assert_response :success
  end

  test "should get edit" do
    get edit_vehiculo_url(@vehiculo)
    assert_response :success
  end

  test "should update vehiculo" do
    patch vehiculo_url(@vehiculo), params: { vehiculo: { capacidadPasajeros: @vehiculo.capacidadPasajeros, color: @vehiculo.color, kilometraje: @vehiculo.kilometraje, marca: @vehiculo.marca, modelo: @vehiculo.modelo, observaciones: @vehiculo.observaciones } }
    assert_redirected_to vehiculo_url(@vehiculo)
  end

  test "should destroy vehiculo" do
    assert_difference('Vehiculo.count', -1) do
      delete vehiculo_url(@vehiculo)
    end

    assert_redirected_to vehiculos_url
  end
end
