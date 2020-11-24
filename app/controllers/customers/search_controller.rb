class Customers::SearchController < ApplicationController
  before_action :authenticate_customer!

	def search
		@word = params[:search_word]
		@product = Product.search(@word)
		
	end
end
