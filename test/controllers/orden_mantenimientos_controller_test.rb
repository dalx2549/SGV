require 'test_helper'

class OrdenMantenimientosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_mantenimiento = orden_mantenimientos(:one)
  end

  test "should get index" do
    get orden_mantenimientos_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_mantenimiento_url
    assert_response :success
  end

  test "should create orden_mantenimiento" do
    assert_difference('OrdenMantenimiento.count') do
      post orden_mantenimientos_url, params: { orden_mantenimiento: { kilometraje: @orden_mantenimiento.kilometraje, tipo: @orden_mantenimiento.tipo, vehiculo_placa: @orden_mantenimiento.vehiculo_placa } }
    end

    assert_redirected_to orden_mantenimiento_url(OrdenMantenimiento.last)
  end

  test "should show orden_mantenimiento" do
    get orden_mantenimiento_url(@orden_mantenimiento)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_mantenimiento_url(@orden_mantenimiento)
    assert_response :success
  end

  test "should update orden_mantenimiento" do
    patch orden_mantenimiento_url(@orden_mantenimiento), params: { orden_mantenimiento: { kilometraje: @orden_mantenimiento.kilometraje, tipo: @orden_mantenimiento.tipo, vehiculo_placa: @orden_mantenimiento.vehiculo_placa } }
    assert_redirected_to orden_mantenimiento_url(@orden_mantenimiento)
  end

  test "should destroy orden_mantenimiento" do
    assert_difference('OrdenMantenimiento.count', -1) do
      delete orden_mantenimiento_url(@orden_mantenimiento)
    end

    assert_redirected_to orden_mantenimientos_url
  end
end
