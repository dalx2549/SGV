class PrestamoWorker
  include Sidekiq::Worker



  def perform(id)
    # Do something
    logger.info "Tarea ejecutandose"
    logger.info id

    @vehiculo = Vehiculo.where(placa: id)
    @vehiculo.each do |vehiculo|

      vehiculo.update_attribute(:disponibilidad, false)

    end

  end
end
