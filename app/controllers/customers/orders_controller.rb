class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
  end

  def create
<<<<<<< HEAD
    # binding.pry
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to customers_complete_path
=======
    @cart_products = current_customer.cart_products
    @totalprice = @cart_products.map{|cart_product|cart_product.product.price * cart_product.quantity}.inject(:+)
    @order = current_customer.orders.new(order_params)
    if params[:order][:addresses] == "myaddress"
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.address
      @order.name        = current_customer.last_name +
                           current_customer.first_name
    elsif params[:order][:addresses] == "shipping_addresses"
      ship = Address.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.address     = ship.address
      @order.name        = ship.name
    elsif params[:order][:addresses] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
      @ship = "1"

    end

    @order.save!
    render customers_complete_path
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
    @order = params[:order][:payment_methods]
    @postal_code = params[:order][:postal_code]
    @address = params[:order][:address]
    @name = params[:order][:name]
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

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end

