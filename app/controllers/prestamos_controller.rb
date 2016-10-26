class PrestamosController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_prestamo, only: [:show, :edit, :update, :destroy]
  #before_filter :find_persona

  # GET /prestamos
  # GET /prestamos.json
  def index
    @prestamos = Prestamo.all
  end

  # GET /prestamos/1
  # GET /prestamos/1.json
  def show
  end

  # GET /prestamos/new
  def new
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
      params.require(:prestamo).permit(:fechaEntrega, :fechaDevolucion, :razon, :observaciones, :persona_cedula, :vehiculo_placa)
    end

  protected

    def find_persona

      @persona = Persona.find(params[:id])

    end

end
