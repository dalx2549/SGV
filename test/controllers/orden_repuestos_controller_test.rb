require 'test_helper'

class OrdenRepuestosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_repuesto = orden_repuestos(:one)
  end

  test "should get index" do
    get orden_repuestos_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_repuesto_url
    assert_response :success
  end

  test "should create orden_repuesto" do
    assert_difference('OrdenRepuesto.count') do
      post orden_repuestos_url, params: { orden_repuesto: { encargado: @orden_repuesto.encargado, fecha: @orden_repuesto.fecha, observaciones: @orden_repuesto.observaciones, proveedor: @orden_repuesto.proveedor, vehiculo_placa: @orden_repuesto.vehiculo_placa } }
    end

    assert_redirected_to orden_repuesto_url(OrdenRepuesto.last)
  end

  test "should show orden_repuesto" do
    get orden_repuesto_url(@orden_repuesto)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_repuesto_url(@orden_repuesto)
    assert_response :success
  end

  test "should update orden_repuesto" do
    patch orden_repuesto_url(@orden_repuesto), params: { orden_repuesto: { encargado: @orden_repuesto.encargado, fecha: @orden_repuesto.fecha, observaciones: @orden_repuesto.observaciones, proveedor: @orden_repuesto.proveedor, vehiculo_placa: @orden_repuesto.vehiculo_placa } }
    assert_redirected_to orden_repuesto_url(@orden_repuesto)
  end

  test "should destroy orden_repuesto" do
    assert_difference('OrdenRepuesto.count', -1) do
      delete orden_repuesto_url(@orden_repuesto)
    end

    assert_redirected_to orden_repuestos_url
  end
end
