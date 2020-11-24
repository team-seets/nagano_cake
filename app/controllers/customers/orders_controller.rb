class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    redirect_to complete_path
  end

  def complete
    @order = Order.new(order_params)
    @order.save
  end

  def thanx
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def thanx
  end


  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :payment_methods, :name, :total_payment)
  end
end
