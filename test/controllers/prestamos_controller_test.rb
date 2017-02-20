require 'test_helper'

class PrestamosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prestamo = prestamos(:one)
  end





  test "should create prestamo" do
    assert_difference('Prestamo.count') do
      post prestamos_url, params: { prestamo: { fechaDevolucion: @prestamo.fechaDevolucion, fechaEntrega: @prestamo.fechaEntrega, observaciones: @prestamo.observaciones, user_cedula: @prestamo.user_cedula, razon: @prestamo.razon, vehiculo_placa: @prestamo.vehiculo_placa } }
    end

    assert_redirected_to prestamo_url(Prestamo.last)
  end

  test "should show prestamo" do
    get prestamo_url(@prestamo)
    assert_response :success
  end



  test "should update prestamo" do
    patch prestamo_url(@prestamo), params: { prestamo: { fechaDevolucion: @prestamo.fechaDevolucion, fechaEntrega: @prestamo.fechaEntrega, observaciones: @prestamo.observaciones, user_cedula: @prestamo.user_cedula, razon: @prestamo.razon, vehiculo_placa: @prestamo.vehiculo_placa } }
    assert_redirected_to prestamo_url(@prestamo)
  end

  test "should destroy prestamo" do
    assert_difference('Prestamo.count', -1) do
      delete prestamo_url(@prestamo)
    end

    assert_redirected_to prestamos_url
  end
end
