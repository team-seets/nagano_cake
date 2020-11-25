class Admins::SearchController < ApplicationController
  before_action :authenticate_admin!

	def search
	  @customers = Customer.all
	  @word = params[:search_word]
	  method = params[:search_method]
	  model = params[:search_model]
	  @customers = Customer.search(method,@word)
	  if model == 'Customer'
	    @customers = Customer.search(method,@word)
	  end
	  pp @customers
	end
end

