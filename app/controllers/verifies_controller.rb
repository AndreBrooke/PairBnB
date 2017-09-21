class VerifiesController < ApplicationController

	before_action :load_listing

	def update
		@listing.verify!
	end

	def destroy
		@listing.unverify!
	end

	private

	def load_listing
		@listing = Listing.find(params[:listing_id])
	end

end
