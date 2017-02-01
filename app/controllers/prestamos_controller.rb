class PrestamosController < ApplicationController


  before_action :set_prestamo, only: [:show, :edit, :update, :destroy]
  #before_filter :find_persona

  # GET /prestamos
  # GET /prestamos.json
  def index

    if admin_signed_in?

      @prestamos = Prestamo.all

    elsif user_signed_in?

      @prestamos = Prestamo.where(user_cedula: current_user.id)
      @vehiculos = Vehiculo.where(:tipo => params[:tipo])

    end
  end




  # GET /prestamos/1
  # GET /prestamos/1.json
  def show
  end

  # GET /prestamos/new
  def new
    @prestamo = Prestamo.new

    @vehiculos = Vehiculo.where(:tipo => params[:tipo])
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
        format.html { redirect_to @prestamo, notice: 'Prestamo realizado.' }
        format.json { render :show, status: :created, location: @prestamo }
      else
        format.html { render :new }
        format.json { render json: @prestamo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prestamos/1
  # PATCH/PUT /prestamos/1.json
  def update
    respond_to do |format|
      if @prestamo.update(prestamo_params)
        format.html { redirect_to @prestamo, notice: 'Prestamo actualizado satisfactioriamente.' }
        format.json { render :show, status: :ok, location: @prestamo }
      else
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

  end


  # DELETE /prestamos/1
  # DELETE /prestamos/1.json
  def destroy
    @prestamo.destroy
    respond_to do |format|
      format.html { redirect_to prestamos_url, notice: 'Prestamo eliminado.' }
      format.json { head :no_content }
    end
  end

  private
  # Uso de callbacks
  def set_prestamo
    @prestamo = Prestamo.find(params[:id])
  end

  def prestamo_params
    params.require(:prestamo).permit(:fechaEntrega, :fechaDevolucion, :razon, :observaciones, :user_cedula, :vehiculo_placa, :chofer)
  end

  protected

  def find_persona

    @persona = Persona.find(params[:id])

  end

end
