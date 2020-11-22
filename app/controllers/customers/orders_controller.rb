class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Orders.new(order_params)
    @order.save
    redirect_to thanx_orders_path
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
end
