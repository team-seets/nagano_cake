class Customers::ProductsController < ApplicationController
  def top
    @product = Product.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def about
  end

  def index
    if params[:genre_id]
       @product = Product.where(genre_id: params[:genre_id]).page(params[:page]).reverse_order
       @genre_name = Genre.find(params[:genre_id]).name
    else
       @product = Product.page(params[:page]).reverse_order
       @genre_name = "商品"
    end
    @genres = Genre.all
  end

  def show
     @product = Product.find(params[:id])
     @cart_product = CartProduct.new
     @genres = Genre.all
  end
end
