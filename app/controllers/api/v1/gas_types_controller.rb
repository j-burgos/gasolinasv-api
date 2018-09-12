class Api::V1::GasTypesController < ApplicationController
  before_action :set_gas_type, only: [:show, :update, :destroy]

  # GET /gas_types
  def index
    @gas_types = GasType.all

    render json: @gas_types
  end

  # GET /gas_types/1
  def show
    render json: @gas_type
  end

  # POST /gas_types
  def create
    @gas_type = GasType.new(gas_type_params)

    if @gas_type.save
      render json: @gas_type, status: :created, location: @gas_type
    else
      render json: @gas_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gas_types/1
  def update
    if @gas_type.update(gas_type_params)
      render json: @gas_type
    else
      render json: @gas_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gas_types/1
  def destroy
    @gas_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gas_type
      @gas_type = GasType.find_by(identifier: params[:identifier])
    end

    # Only allow a trusted parameter "white list" through.
    def gas_type_params
      params.require(:gas_type).permit(:name)
    end
end
