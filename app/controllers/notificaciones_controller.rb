class NotificacionesController < ApplicationController

  helper_method :prestamosPendientes

  def prestamosPendientes

    @pendientes = Prestamo.count(approved: false)

  end

end
