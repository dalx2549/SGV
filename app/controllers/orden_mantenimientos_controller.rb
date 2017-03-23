class OrdenMantenimientosController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_orden_mantenimiento, only: [:show, :edit, :update, :destroy]

  # GET /orden_mantenimientos
  # GET /orden_mantenimientos.json
  def index

    @history_mantenimientos = OrdenMantenimiento.all
    @orden_mantenimientos = OrdenMantenimiento.all
  end

  # GET /orden_mantenimientos/1
  # GET /orden_mantenimientos/1.json
  def show
  end

  # GET /orden_mantenimientos/new
  def new
    @orden_mantenimiento = OrdenMantenimiento.new
  end

  # GET /orden_mantenimientos/1/edit
  def edit
  end

  # POST /orden_mantenimientos
  # POST /orden_mantenimientos.json
  def create
    @orden_mantenimiento = OrdenMantenimiento.new(orden_mantenimiento_params)

    respond_to do |format|
      if @orden_mantenimiento.save
        format.html { redirect_to @orden_mantenimiento, notice: 'Orden creada satisfactoriamente.' }
        format.json { render :show, status: :created, location: @orden_mantenimiento }
      else
        format.html { render :new }
        format.json { render json: @orden_mantenimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_mantenimientos/1
  # PATCH/PUT /orden_mantenimientos/1.json
  def update
    respond_to do |format|
      if @orden_mantenimiento.update(orden_mantenimiento_params)
        format.html { redirect_to @orden_mantenimiento, notice: 'Orden actualizada.' }
        format.json { render :show, status: :ok, location: @orden_mantenimiento }
      else
        format.html { render :edit }
        format.json { render json: @orden_mantenimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_mantenimientos/1
  # DELETE /orden_mantenimientos/1.json
  def destroy
    @orden_mantenimiento.destroy
    respond_to do |format|
      format.html { redirect_to orden_mantenimientos_url, notice: 'Orden eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_mantenimiento
      @orden_mantenimiento = OrdenMantenimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_mantenimiento_params
      params.require(:orden_mantenimiento).permit(:vehiculo_placa, :tipo, :kilometraje, :encargado, :cedula, :cargo, :detalle)
    end
end
