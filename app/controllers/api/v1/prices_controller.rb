class Api::V1::PricesController < ApplicationController
  before_action :set_price, only: [:show, :update, :destroy]

  # GET /prices
  def index
    query = get_query
    @prices = if query then Price.where query else Price.all end

    render json: @prices
  end

  # GET /prices/1
  def show
    render json: @price
  end

  # POST /prices
  def create
    @price = Price.new(price_params)

    if @price.save
      render json: @price, status: :created, location: @price
    else
      render json: @price.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prices/1
  def update
    if @price.update(price_params)
      render json: @price
    else
      render json: @price.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prices/1
  def destroy
    @price.destroy
  end

  # GET /prices/latest
  def latest
    query = get_query
    last = Price.all.order("created_at").last
    @prices = if query
      then
        Price.where(query.merge({ from: last.from, to: last.to }))
      else
        Price.where(from: last.from)
      end
    render json: @prices
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def price_params
      params.require(:price).permit(:from, :to, :price)
    end

    def get_query
      query = {}

      gas_type_param = params[:'gas-type'] || params[:gas_type_identifier]
      if gas_type_param then
        gas_type = GasType.find_by(identifier: gas_type_param)
        query[:gas_type_id] = gas_type.id
      end

      zone_param = params[:zone] || params[:zone_identifier]
      if zone_param then
        zone = Zone.find_by(identifier: zone_param)
        query[:zone_id] = zone.id
      end

      from_param = params[:from] || DateTime.new
      to_param = params[:to] || DateTime.current

      query[:from] = from_param..to_param
      query[:to] = from_param..to_param

      query
    end
end
