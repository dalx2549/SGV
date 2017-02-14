class PrestamosController < ApplicationController

  #Callback para evitar cualquier accion sin usuario logeado


  #Callback que permite CRUD de prestamo
  before_action :set_prestamo, only: [:show, :edit, :update, :destroy]


  # GET /prestamos
  # GET /prestamos.json
  def index


    if admin_signed_in?

      #Indexa todos los prestamos de la tabla si el admin está logeado
      @prestamos = Prestamo.all

    elsif user_signed_in?

      #Indexa solo los prestamos correspondientes al usuario logeado
      #Realiza un query con el id del usuario actual y busca prestamos correspondientes a ese id.

      @prestamos = Prestamo.where(user_cedula: current_user.id)


    end
  end


  # GET /prestamos/1
  # GET /prestamos/1.json
  def show
  end

  # GET /prestamos/new
  def new

    #Crea un nuevo objeto Prestamo
    @prestamo = Prestamo.new


  end

  # GET /prestamos/1/edit
  def edit
  end

  # POST /prestamos
  # POST /prestamos.json
  def create
    @prestamo = Prestamo.new(prestamo_params)

    respond_to do |format|
      if @prestamo.save
        #Muestra el prestamo creado
        format.html { redirect_to @prestamo, notice: 'Prestamo realizado.' }
        #Renderiza json con el prestamo creado
        format.json { render :show, status: :created, location: @prestamo }

      else
        #Muestra de nuevo el formulario para crear un prestamo
        format.html { render :new }
        #Actualiza el json con los errores presentados al intentar crear el prestamo
        format.json { render json: @prestamo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prestamos/1
  # PATCH/PUT /prestamos/1.json
  def update
    respond_to do |format|
      if @prestamo.update(prestamo_params)
        #Muestra el prestamo actualizado si cumple con los parámetros permitidos
        format.html { redirect_to @prestamo, notice: 'Prestamo actualizado satisfactioriamente.' }
        format.json { render :show, status: :ok, location: @prestamo }
      else
        #Muestra un mensaje de error en el HTML y renderiza json como improcesable
        format.html { render :edit }
        format.json { render json: @prestamo.errors, status: :unprocessable_entity }
      end
    end
  end

  def approve

    @prestamo = Prestamo.find(params[:id])
    @prestamo.update_attributes(approved: true)
    redirect_to prestamos_url

    # Modifica disponibilidad del vehiculo
    @vehiculo = Vehiculo.where(placa: @prestamo.vehiculo_placa) #Query para seleccionar el vehiculo del prestamo.
    @vehiculo.update(disponibilidad: false) #Cambia atributo a false

    id = @vehiculo.ids


    logger.info id
    PrestamoWorker.perform_in(2.minutes, 10)

  end



  # DELETE /prestamos/1
  # DELETE /prestamos/1.json
  def destroy
    #Llamada al método destroy para eliminar un objeto del tipo prestamo
    @prestamo.destroy
    respond_to do |format|
      #Redirige al index de Prestamos y muestra mensaje de eliminación
      format.html { redirect_to prestamos_url, notice: 'Prestamo eliminado.' }
      #Vacía el json de prestamo a eliminar (:no_content)
      format.json { head :no_content }
    end
  end

  private
  # Uso de callbacks para encontrar cada prestamo por ID
  def set_prestamo
    @prestamo = Prestamo.find(params[:id])
  end

  #Define parámetros permitidos para crear un prestamo
  def prestamo_params
    params.require(:prestamo).permit(:fechaEntrega, :fechaDevolucion, :razon, :observaciones, :user_cedula, :vehiculo_placa, :chofer)
  end



end
