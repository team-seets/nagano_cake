class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # @cart_products = current_customer.cart_products
    @order_detail = @order.order_details
    @totalprice = @order_detail.map{|order_detail|order_detail.product.price * order_detail.amount}.inject(:+)
    #@cart_products = @order.cart_products
    
		#@order_detail = params[:making_status]
  end

  def index
    @orders = Order.all
    @order = params[:name]
    #@order_details = OrderDetails.all
    #@order_detail = OrdrDetail.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_orders_path
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

  def order_details_params
    params.require(:order_details).permit(:amount, :making_status)
  end
end