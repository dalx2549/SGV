require 'test_helper'

class FacturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @factura = facturas(:one)
  end

  test "should get index" do
    get facturas_url
    assert_response :success
  end

  test "should get new" do
    get new_factura_url
    assert_response :success
  end



  test "should show factura" do
    get factura_url(@factura)
    assert_response :success
  end

  test "should get edit" do
    get edit_factura_url(@factura)
    assert_response :success
  end

  test "should update factura" do
    patch factura_url(@factura), params: { factura: { emisor: @factura.emisor, id_orden_combustible: @factura.id_orden_combustible, id_orden_mantenimiento: @factura.id_orden_mantenimiento, id_orden_respuesto: @factura.id_orden_respuesto, numero: @factura.numero } }
    assert_redirected_to factura_url(@factura)
  end

  test "should destroy factura" do
    assert_difference('Factura.count', -1) do
      delete factura_url(@factura)
    end

    assert_redirected_to facturas_url
  end
end
