class OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def create
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def complete
  end
end
