class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show ]
  before_action :set_current_user, if: -> { Rails.env.development? }

  # GET /orders
  def index
    # list order untuk halaman list bagi admin 
    @orders = Order.all
  end

  def calculate_price
    address = Address.find(params[:address_id])
    total_price = Order.calculate_total_price(params[:courier], address)
    render json: { total_price: total_price }
  end
  # GET /orders/1
  def show
    # list order untuk halaman detail bagi admin
  end

  # GET /orders/new
  # STATE order disini belum dicatat
  def new
    # form untuk checkout page
    @order = Order.new
    # form.collection_select :address_id, current_user.addresses, :id, :full_address 
    @couriers = Shipping.all
  end


  # POST /orders
  # STATE order disini sudah menjadi PENDING
  def create
    @order = Order.new(order_params)

    if @order.checkout
      redirect_to @order, notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # state machine yang lain disini
  
  private
    def set_current_user
      @current_user = User.first
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :total_price)
    end
end
