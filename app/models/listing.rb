class Listing < ApplicationRecord
	attr_accessor :images
	has_many :bookings
	has_many :reviews
	has_many :photos
	belongs_to :user
	acts_as_taggable
	acts_as_taggable_on :interests, :rules, :locations
	self.per_page = 10
	mount_uploaders :images, ImagesUploader

	def self.search(search)
		where("listing_name ILIKE ? OR country ILIKE ? OR city ILIKE?", "%#{search}%", "%#{search}%", "%#{search}%")
	end

	def verified?
		verified_at != nil
	end

	def verify
		self.verified_at = Time.now
	end

	def verify!
		verify
		save!
	end

	def unverify
		self.verified_at = nil
	end

	def unverify!
		unverify
		save!
	end

end
