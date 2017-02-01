class OrdenCombustiblesController < ApplicationController


  before_action :set_orden_combustible, only: [:show, :edit, :update, :destroy]

  # GET /orden_combustibles
  # GET /orden_combustibles.json
  def index

      @history = OrdenCombustible.all
      @orden_combustibles = OrdenCombustible.all

  end


  # GET /orden_combustibles/1
  # GET /orden_combustibles/1.json
  def show
  end

  # GET /orden_combustibles/new
  def new
    @orden_combustible = OrdenCombustible.new
  end

  # GET /orden_combustibles/1/edit
  def edit
  end

  # POST /orden_combustibles
  # POST /orden_combustibles.json
  def create
    @orden_combustible = OrdenCombustible.new(orden_combustible_params)

    respond_to do |format|
      if @orden_combustible.save
        format.html { redirect_to @orden_combustible, notice: 'Orden combustible was successfully created.' }
        format.json { render :show, status: :created, location: @orden_combustible }
      else
        format.html { render :new }
        format.json { render json: @orden_combustible.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_combustibles/1
  # PATCH/PUT /orden_combustibles/1.json
  def update
    respond_to do |format|
      if @orden_combustible.update(orden_combustible_params)
        format.html { redirect_to @orden_combustible, notice: 'Orden combustible was successfully updated.' }
        format.json { render :show, status: :ok, location: @orden_combustible }
      else
        format.html { render :edit }
        format.json { render json: @orden_combustible.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_combustibles/1
  # DELETE /orden_combustibles/1.json
  def destroy
    @orden_combustible.destroy
    respond_to do |format|
      format.html { redirect_to orden_combustibles_url, notice: 'Orden combustible was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_orden_combustible
    @orden_combustible = OrdenCombustible.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def orden_combustible_params
    params.require(:orden_combustible).permit(:id, :estacionServicio, :vehiculo_placa, :fechaEmision, :tipoCombustible, :valorCompra, :persona, :cedula, :cargo)
  end
end
