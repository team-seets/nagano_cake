class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    # binding.pry
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to customers_complete_path
  end

  def complete
    @cart_products = current_customer.cart_products
    @totalprice = @cart_products.map{|cart_product|cart_product.product.price * cart_product.quantity}.inject(:+)
    # @order = Order.new
    # @order.payment_methods = params[:order][:payment_methods]
    # if params[:order][:select] == "1"
    #   @order.postal_code = current_customer.postal_code
    #   @order.address = current_customer.address
    #   @order.name = current_customer.last_name + current_customer.first_name
    # # elsif 
    # else
    # @order.postal_code = params[:order][:postal_code]
    # @order.address = params[:order][:address]
    # @name = params[:order][:name]
    # end
  end

  def thanx
  end

  def index
    @cart_products = current_customer.cart_products
    # @order = Order.find(params[:id])
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
