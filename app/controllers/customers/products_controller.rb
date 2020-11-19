class ProductsController < ApplicationController
  
  def top
  end

  def about
  end
  
  def index
    @product = Product.all
  end

  def show
  end
end
