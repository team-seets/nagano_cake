class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
    
  end

  def create
    # @order = Order.new(order_params)
    # @order.customer_id = current_customer.id
    # @order.save
    # redirect_to customers_complete_path
  end

  def complete
    @cart_products = current_customer.cart_products
    @totalprice = @cart_products.map{|cart_product|cart_product.product.price * cart_product.quantity}.inject(:+)
    @order = params[:order][:payment_methods]
    @postal_code = params[:order][:postal_code]
    @address = params[:order][:address]
    @name = params[:order][:name]
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
    params.require(:order).permit(:postal_code, :address, :payment_methods, :name, :total_payment, :shipping_cost)
  end
end
