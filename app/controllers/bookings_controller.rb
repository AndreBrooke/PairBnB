class BookingsController < ApplicationController
	before_action :require_login

	def preload

		listing = Listing.find(params[:room_id])
		today = Date.today
		booking = listing.bookings.where("check_in >= ? OR check_out >= ?", today, today)

		render json: bookings
	end

	def new
		@booking = Booking.new
	end

	def edit
		@booking = Booking.find(params[:id])
	end

	def show
		@booking = Booking.find(params[:id])
	end

	def index
		current_user.Bookings 
	end

	def update
		@booking = Booking.find(params[:id])
		if @booking.update(booking_params)
			redirect to @booking
		else
			render template: "booking/new"
		end
	end

	def create
		@booking = current_user.bookings.create(booking_params)

			redirect to @booking.listing, notice: "Your booking has been made..."
		
	end

	private
	def booking_params
		params.require(:booking).permit(:check_in, :check_out, :rent, :total, :listing_id)
	end
end
