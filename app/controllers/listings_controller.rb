class ListingsController < ApplicationController
	def new
		@listing= Listing.new
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def create
		@listing = current_user.listings.new(listing_params)
		
		if @listing.save
			redirect_to @listing
		else
			render template: "listings/new"
		end
	end

	def all
		@listing = Listing.new
	end

	def index

		@listings = Listing.all
		if params[:search]
			@listings = Listing.search(params[:search]).order("created_at DESC")
		else
			@listings = Listing.all.page(params[:page]).order('created_at DESC')
		end
	end

	private

	def listing_params
		params.require(:listing).permit(:description, :status, :city, :country, :address, :number_of_rooms, :rent, :min_stay, :private_room, :shared_room, :entire_house, :listing_name, :place_type, :state, :zipcode,  :tag_list)
	end
end

