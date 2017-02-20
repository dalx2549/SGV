class PrestamoWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    logger.info "Tarea ejecutandose bla bla"



  end
end
