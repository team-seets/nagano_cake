class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to thanx_path
  end

  def thanx
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :payment_methods, :name, :total_payment)
  end
end
