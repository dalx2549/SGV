require 'test_helper'

class OrdenCombustiblesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_combustible = orden_combustibles(:one)
  end

  test "should get index" do
    get orden_combustibles_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_combustible_url
    assert_response :success
  end

  test "should create orden_combustible" do
    assert_difference('OrdenCombustible.count') do
      post orden_combustibles_url, params: { orden_combustible: { cargo: @orden_combustible.cargo, cedula: @orden_combustible.cedula, estacionServicio: @orden_combustible.estacionServicio, id: @orden_combustible.id, persona: @orden_combustible.persona, tipoCombustible: @orden_combustible.tipoCombustible, valorCompra: @orden_combustible.valorCompra, vehiculo_placa: @orden_combustible.vehiculo_placa } }
    end

    assert_redirected_to orden_combustible_url(OrdenCombustible.last)
  end

  test "should show orden_combustible" do
    get orden_combustible_url(@orden_combustible)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_combustible_url(@orden_combustible)
    assert_response :success
  end

  test "should update orden_combustible" do
    patch orden_combustible_url(@orden_combustible), params: { orden_combustible: { cargo: @orden_combustible.cargo, cedula: @orden_combustible.cedula, estacionServicio: @orden_combustible.estacionServicio, id: @orden_combustible.id, persona: @orden_combustible.persona, tipoCombustible: @orden_combustible.tipoCombustible, valorCompra: @orden_combustible.valorCompra, vehiculo_placa: @orden_combustible.vehiculo_placa } }
    assert_redirected_to orden_combustible_url(@orden_combustible)
  end

  test "should destroy orden_combustible" do
    assert_difference('OrdenCombustible.count', -1) do
      delete orden_combustible_url(@orden_combustible)
    end

    assert_redirected_to orden_combustibles_url
  end
end
