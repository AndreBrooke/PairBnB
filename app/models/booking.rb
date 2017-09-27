class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	validate :cannot_overlap


	def total_cost
		self.listing.rent * (self.check_out.to_date - self.check_in.to_date).to_i
	end

	def cannot_overlap
		self.listing.bookings.each do |book|
			if (self.check_in.to_date..self.check_out.to_date).overlaps?(book.check_in.to_date..book.check_out.to_date)
				errors.add(:date, "not available")
				return
			end
		end
	end
end
