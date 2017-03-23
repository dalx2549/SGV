class ChofersController < ApplicationController
  before_action :set_chofer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!

  # GET /chofers
  # GET /chofers.json
  def index
    @chofers = Chofer.all
  end

  # GET /chofers/1
  # GET /chofers/1.json
  def show
  end

  # GET /chofers/new
  def new
    @chofer = Chofer.new
  end

  # GET /chofers/1/edit
  def edit
  end

  # POST /chofers
  # POST /chofers.json
  def create
    @chofer = Chofer.new(chofer_params)

    respond_to do |format|
      if @chofer.save

        ChoferRegistradoMailer.send_email_chofer(@chofer).deliver

        format.html { redirect_to @chofer, notice: 'Conductor guardado correctamente.' }
        format.json { render :show, status: :created, location: @chofer }
      else
        format.html { render :new }
        format.json { render json: @chofer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chofers/1
  # PATCH/PUT /chofers/1.json
  def update
    respond_to do |format|
      if @chofer.update(chofer_params)
        format.html { redirect_to @chofer, notice: 'Conductor ha sido actualizado.' }
        format.json { render :show, status: :ok, location: @chofer }
      else
        format.html { render :edit }
        format.json { render json: @chofer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chofers/1
  # DELETE /chofers/1.json
  def destroy
    @chofer.destroy
    respond_to do |format|
      format.html { redirect_to chofers_url, notice: 'Conductor Eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chofer
      @chofer = Chofer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chofer_params
      params.require(:chofer).permit(:cedula, :nombres, :apellidos, :fechaNacimiento, :tipoLicencia, :experiencia, :direccion, :email, :telefono, :avatar, {licencias: []})
    end
end