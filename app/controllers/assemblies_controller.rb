class AssembliesController < ApplicationController
  before_action :set_assembly, only: [:show, :update, :destroy]

  # GET /assemblies
  # GET /assemblies.json
  def index
    @assemblies = Assembly.all
  end

  # GET /assemblies/1
  # GET /assemblies/1.json
  def show
  end

  # POST /assemblies
  # POST /assemblies.json
  def create
    @assembly = Assembly.new(assembly_params)

    if @assembly.save
      render :show, status: :created, location: @assembly
    else
      render json: @assembly.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /assemblies/1
  # PATCH/PUT /assemblies/1.json
  def update
    if @assembly.update(assembly_params)
      render :show, status: :ok, location: @assembly
    else
      render json: @assembly.errors, status: :unprocessable_entity
    end
  end

  # DELETE /assemblies/1
  # DELETE /assemblies/1.json
  def destroy
    @assembly.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assembly
      @assembly = Assembly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assembly_params
      params.require(:assembly).permit(:product_id, :material_id, :quantity)
    end
end
