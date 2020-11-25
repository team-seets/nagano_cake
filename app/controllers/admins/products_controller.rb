class Admins::ProductsController < ApplicationController
  before_action :authenticate_customer!

  def top
    @orders = Order.all
  end

  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admins_products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admins_products_path, notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private
  def product_params
    params.require(:product).permit( :image, :name, :introduction, :price, :genre_id, :is_active )
  end
end
