class BookingsController < ApplicationController
	before_action :require_login
	

	def new
		@booking = Booking.new
	end

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
		
		@booking = Booking.new(booking_params)
		if @booking.cannot_overlap
			redirect_to braintree_new_path(listing_id: @booking.listing_id, :check_in => @booking.check_in, :check_out => @booking.check_out), notice: "Please make payment"
		else
			redirect_to :root,  notice: "Invalid date selection"
		end
	end

	private
	def booking_params
		params[:booking][:check_in] = DateTime.strptime(params[:booking][:check_in], '%m/%d/%Y')
		params[:booking][:check_out] = DateTime.strptime(params[:booking][:check_out], '%m/%d/%Y')
		params.require(:booking).permit(:check_in, :check_out, :rent, :max_guests, :listing_id)
	end
end
