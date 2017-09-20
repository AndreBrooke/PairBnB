class Listing < ApplicationRecord
	has_many :bookings
	has_many :reviews
	belongs_to :user
	acts_as_taggable
	acts_as_taggable_on :interests, :rules, :locations
	self.per_page = 10

	def self.search(search)
		where("listing_name ILIKE ? OR country ILIKE ? OR city ILIKE?", "%#{search}%", "%#{search}%", "%#{search}%")
	end
end
