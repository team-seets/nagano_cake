class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all
    @order = params[:name]
    @order_details = params[:amount]
  end

  def update

  end

  private
  def order_params
    params.require(:order).permit(:status, :name)
  end

  def order_details_params
    params.require(:order_details).permit(:amount)
  end
end
