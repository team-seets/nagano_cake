class Admins::ProductsController < ApplicationController
  def top
  end

  def index
  end

  def new
    @product = Product.all
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end
  
  private
  def product_params
    params.require(:product).permit(:image) 
  end
end
