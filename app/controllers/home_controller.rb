class HomeController < ApplicationController
	def index
		@user = current_user
		@listing = Listing.all
	end
end

