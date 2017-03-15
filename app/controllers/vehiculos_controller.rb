class VehiculosController < ApplicationController
  before_action :set_vehiculo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!



  # GET /vehiculos
  # GET /vehiculos.json
  def index
    @vehiculos = Vehiculo.all
  end

  # GET /vehiculos/1
  # GET /vehiculos/1.json
  def show

    @vehiculo = Vehiculo.find(params[:id])
    @orden_combustibles = OrdenCombustible.where(:vehiculo_placa => @vehiculo.id)
    @orden_mantenimientos = OrdenMantenimiento.where(:vehiculo_placa => @vehiculo.id )
    @orden_repuestos = OrdenRepuesto.where(:vehiculo_placa => @vehiculo.id)

  end

  # GET /vehiculos/new
  def new
    @vehiculo = Vehiculo.new
  end

  # GET /vehiculos/1/edit
  def edit

    @vehiculo = Vehiculo.find(params[:id])
  end


  # POST /vehiculos
  # POST /vehiculos.json
  def create
    @vehiculo = Vehiculo.new(vehiculo_params)

    respond_to do |format|
      if @vehiculo.save
        format.html { redirect_to @vehiculo, notice: 'Vehículo creado satisfactoriamente' }
        format.json { render :show, status: :created, location: @vehiculo }
      else
        format.html { render :new }
        format.json { render json: @vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  def devolver

    @vehiculo = Vehiculo.find(params[:id])
    @vehiculo.update_attributes(disponibilidad: true)

  end


  # PATCH/PUT /vehiculos/1
  # PATCH/PUT /vehiculos/1.json
  def update
    respond_to do |format|
      if @vehiculo.update(vehiculo_params)
        format.html { redirect_to @vehiculo, notice: 'Vehiculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehiculo }
      else
        format.html { render :edit }
        format.json { render json: @vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehiculos/1
  # DELETE /vehiculos/1.json
  def destroy
    @vehiculo.destroy
    respond_to do |format|
      format.html { redirect_to vehiculos_url, notice: 'Vehículo eliminado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehiculo
      @vehiculo = Vehiculo.find(params[:id])
    end

    def vehiculo_params
      params.require(:vehiculo).permit(:placa, :marca, :modelo, :color, :tipo, :kilometraje, :anio, :capacidadPasajeros, :capacidadCarga, :observaciones, :disponibilidad,:nro_chasis, :cilindraje,  {avatars: []}, :traccion, :mantenimiento)
    end
end
