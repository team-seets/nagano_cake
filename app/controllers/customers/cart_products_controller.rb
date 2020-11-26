class Customers::CartProductsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_product = current_customer.cart_products
    if @cart_product.empty?
       @totalprice = 0
    else

       @totalprice = @cart_product.map{|cart_product|cart_product.product.price * cart_product.quantity}.inject(:+).to_s(:delimited)
    end
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    @cart_product.save
    redirect_to cart_products_path
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.update(cart_product_params)
      redirect_to cart_products_path, notice: ''
    else
      render 'index'
    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to cart_products_path
  end

  def destroy_all
    @cart_product = current_customer.cart_products
    @cart_product.destroy_all
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to cart_products_path
  end
  
  private
    def cart_product_params
       params.require(:cart_product).permit(:product_id, :quantity)
    end
end
