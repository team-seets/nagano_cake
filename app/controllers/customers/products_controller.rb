<<<<<<< HEAD
class ProductsController < ApplicationController
  
=======
class Customers::ProductsController < ApplicationController
>>>>>>> 63231551c26a2f3721a7d70d9bdbc7850a53334c
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
