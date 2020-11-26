class Customers::ProductsController < ApplicationController
  def top
    @product = Product.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def about
  end

  def index
    @product = Product.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def show
     @product = Product.find(params[:id])
     @cart_product = CartProduct.new
     @genres = Genre.all
  end
end
