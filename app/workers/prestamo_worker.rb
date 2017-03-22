class PrestamoWorker
  include Sidekiq::Worker


 #Ejecuta una tarea en segundo plano, recibe el id de un vehículo como parametro
  def perform(id)
    # Do something
    logger.info "Tarea ejecutandose"
    logger.info id


    # Selecciona el vehículo con el id correspondiente al parametro
    @vehiculo = Vehiculo.where(placa: id)
    @vehiculo.each do |vehiculo|

      #Cambia la disponibilidad del vehículo a false
      vehiculo.update_attribute(:disponibilidad, false)

    end

  end
end
