class BookingMailer < ApplicationMailer
	def booking_email(booking)
		@user_host = booking.listing.user
		@user_guest = booking.user
		@url = 'localhost:3000/users/#{@user_guest.id}/bookings'
		mail(to: @user_guest.email, subject: "Booking confirmation")
	end
end
