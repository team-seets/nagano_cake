class Customers::ProductsController < ApplicationController
  def top
    @product = Product.all
     @genres = Genre.all
  end

  def about
  end

  def index
    @product = Product.all
    @genres = Genre.all
  end

  def show
     @product = Product.find(params[:id])
     @cart_product = CartProduct.new
     @genres = Genre.all
  end
end
