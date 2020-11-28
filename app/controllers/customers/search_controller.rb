class Customers::SearchController < ApplicationController
  before_action :authenticate_customer!

	def search
		@products = Product.all
		@word = params[:search_word]
		method = params[:search_method]
		model = params[:search_model]
		@product = Product.search(method,@word)
		if model == 'Product'
	    @products = Product.search(method,@word)
	  end
	  pp @products
	end
	
  def products
    @value = params["search"]["value"]        
    @how = params["search"]["how"]            
    @datas = search_for(@how, @value).page(params[:page]).reverse_order 
    @genres = Genre.all
    @genre = Genre.find(@value)
  end

  private

  def match(value)
   
    Product.where(name: value).or(Product.where(genre_id: value))
  end

  def forward(value)                              
    Product.where("name LIKE ?", "#{value}%")        
  end

  def backward(value)
    Product.where("name LIKE ?", "%#{value}")
  end

  def partical(value)
    Product.where("name LIKE ?", "%#{value}%")
  end


  def search_for(how, value)
    case how                     
    when 'match'                 
      match(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end
end
