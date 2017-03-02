class PrestamoWorker
  include Sidekiq::Worker

  def perform(id)
    # Do something
    logger.info "Tarea ejecutandose bla bla"



  end
end
