class Admins::SearchController < ApplicationController
  before_action :authenticate_admin!

	def search
		@word = params[:search_word]
		@customers = Customers.search(method,@word)
	end
end

