class BookingsController < ApplicationController
	before_action :require_login
	

	def new
		@booking = Booking.new
	end

# 	Listing.all
# @booking = Booking.all

# @boooking.find(i).listing_id

# @listing = Listing.all

# @listing.find(current_user.listing_ids[0])

# current_user.booking_ids[i]

# @listing.find(@booking.find(@user.booking_ids[0]).listing_id)

	def index
		@bookings = Booking.all
		@listings = Listing.all 
		@listing_book = current_user.booked_listing
	end

	def edit
		@booking = Booking.find(params[:id])
	end

	def user_show
		@booking = current_user
	end

	def show
		@booking = Booking.find(params)
	end

	def update
		@booking = Booking.find(params[:id])
		if @booking.update(booking_params)
			redirect_to @booking
		else
			render template: "booking/new"
		end
	end

	def create
		@booking = current_user.bookings.create(booking_params)

			redirect_to @booking.listing, notice: "Your booking has been made..."
		
	end

	private
	def booking_params
		params.require(:booking).permit(:check_in, :check_out, :rent, :max_guests, :listing_id)
	end
end
