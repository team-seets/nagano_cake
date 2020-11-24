class Customers::ProductsController < ApplicationController
  def top
    @product = Product.all
  end

  def about
  end

  def index
    @product = Product.all
  end

  def show
     @product = Product.find(params[:id])
     @cart_product = CartProduct.new
  end
end
