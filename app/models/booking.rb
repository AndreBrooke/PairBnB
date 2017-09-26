class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	validate :check_overlapping_dates
	validate :check_max_guests

	def check_overlapping_date
		errors.add(:overlapping_dates, "The booking dates conflict with existing bookings")
	end

	def overlap(x,y)
		(x.check_in - y.check_out) == (y.first - x.end) > 0
	end

	def check_max_guests
		max_guests = listing.max_guests
		return if num_guests < max_guests
		errors.add(:max_guests, "Max guests number exceeded")
	end

end
