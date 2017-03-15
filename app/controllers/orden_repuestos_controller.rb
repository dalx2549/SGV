class OrdenRepuestosController < ApplicationController
  before_action :set_orden_repuesto, only: [:show, :edit, :update, :destroy]

  # GET /orden_repuestos
  # GET /orden_repuestos.json
  def index
    @orden_repuestos = OrdenRepuesto.all
    @history_repuestos = OrdenRepuesto.all
  end

  # GET /orden_repuestos/1
  # GET /orden_repuestos/1.json
  def show
  end

  # GET /orden_repuestos/new
  def new
    @orden_repuesto = OrdenRepuesto.new
  end

  # GET /orden_repuestos/1/edit
  def edit
  end

  # POST /orden_repuestos
  # POST /orden_repuestos.json
  def create
    @orden_repuesto = OrdenRepuesto.new(orden_repuesto_params)

    respond_to do |format|
      if @orden_repuesto.save
        format.html { redirect_to @orden_repuesto, notice: 'Orden repuesto was successfully created.' }
        format.json { render :show, status: :created, location: @orden_repuesto }
      else
        format.html { render :new }
        format.json { render json: @orden_repuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_repuestos/1
  # PATCH/PUT /orden_repuestos/1.json
  def update
    respond_to do |format|
      if @orden_repuesto.update(orden_repuesto_params)
        format.html { redirect_to @orden_repuesto, notice: 'Orden repuesto was successfully updated.' }
        format.json { render :show, status: :ok, location: @orden_repuesto }
      else
        format.html { render :edit }
        format.json { render json: @orden_repuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_repuestos/1
  # DELETE /orden_repuestos/1.json
  def destroy
    @orden_repuesto.destroy
    respond_to do |format|
      format.html { redirect_to orden_repuestos_url, notice: 'Orden repuesto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_repuesto
      @orden_repuesto = OrdenRepuesto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_repuesto_params
      params.require(:orden_repuesto).permit(:fecha, :encargado, :proveedor, :observaciones, :vehiculo_placa, :detalle, :avatar, :cedula, :cargo)
    end
end
