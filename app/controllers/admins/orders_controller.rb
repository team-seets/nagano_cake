class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all
  end

  def update

  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
