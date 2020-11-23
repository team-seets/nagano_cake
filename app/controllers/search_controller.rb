class SearchController < ApplicationController
  before_action :authenticate_customer!

	def search
		@word = params[:search_word]
		@products = Products.search(method,@word)
	end
end
