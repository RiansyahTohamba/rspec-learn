class ShippingsController < ApplicationController
  before_action :set_shipping, only: %i[ show update destroy ]

  # GET /shippings
  def index
    @shippings = Shipping.all

    render json: @shippings
  end

  # GET /shippings/1
  def show
    render json: @shipping
  end

  # POST /shippings
  def create
    @shipping = Shipping.new(shipping_params)

    if @shipping.save
      render json: @shipping, status: :created, location: @shipping
    else
      render json: @shipping.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shippings/1
  def update
    if @shipping.update(shipping_params)
      render json: @shipping
    else
      render json: @shipping.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shippings/1
  def destroy
    @shipping.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping
      @shipping = Shipping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipping_params
      params.require(:shipping).permit(:tracking_number, :carrier, :status, :shipped_at, :delivered_at, :cost, :order_id)
    end
end
