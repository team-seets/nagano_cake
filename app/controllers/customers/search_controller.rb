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
end
