class HomeController < ApplicationController
	def index
		@user = current_user
		@listing = Listing.new
		@booking = current_user.bookings
	end
end

