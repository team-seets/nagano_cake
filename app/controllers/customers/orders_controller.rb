class Customers::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
  end

  def create
    @cart_products = current_customer.cart_products
   
    @order = Order.new(order_params)
    if @order.save
    
    @cart_products.each do |cart_product|
      @order_detail = OrderDetail.new
      @order_detail.amount = cart_product.quantity
      @order_detail.price = cart_product.product.price
      @order_detail.order_id = @order.id
      @order_detail.product_id = cart_product.product.id
      @order_detail.save
    end
    redirect_to thanx_path
    else
      render '/customers/orders/complete'
    end

  end


  def complete
    @cart_products = current_customer.cart_products
    @totalprice = @cart_products.map{|cart_product|cart_product.product.price * cart_product.quantity}.inject(:+)
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.total_payment = @totalprice
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

  end

  def thanx
  end

  def index
    @orders = Order.all
    @cart_products = current_customer.cart_products
    @order_detail = current_customer.cart_products
  end

  def show
    @cart_products = current_customer.cart_products
    @totalprice = @cart_products.map{|cart_product|cart_product.product.price * cart_product.quantity}.inject(:+)
    @orders = Order.find(params[:id])
  end

  def thanx
  end


  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :payment_methods, :name, :total_payment, :shipping_cost, :status, :customer_id,  :address_id, :addresses )
  end
  
end