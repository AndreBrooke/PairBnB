class ListingsController < ApplicationController

	def new
		allowed?(action: @listing= Listing.new, user:current_user)
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def edit
		allowed?(action: @listing = Listing.find(params[:id]), user:current_user)
	end

	def user_listing
		@user = User.find(params[:user_id])
		@listings = @user.listings
	end

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to @listing
		else
			redirect_to template: "listings/new"
		end
	end

	def update
		@listing = current_user.listings.update(listing_params)
		if @listing != nil 
			if @listing.save
				redirect_to @listing
			else
				redirect_to template: "listings/edit"
			end
		else
			redirect_to '/'
			flash[:notice] = "You haven't made a listing yet"
		end
	end

	def index
		@listings = Listing.all
		if params[:search]
			
			# @listings = Listing.search(params[:search]).page(params[:page]).order("created_at DESC")
			@listings = Listing.filter(params.slice(:city, :min_stay, :number_of_rooms, :rent)).page(params[:page]).order("created_at DESC")
		else
			@listings = Listing.all.page(params[:page]).order('created_at DESC')
		end

	end

	def verify
		@listing = Listing.find(params[:id])
		@listing.update_attributes(:verification => true)
		flash[:notice] = "Listing verified"
	end


	private

	def listing_params
		params.require(:listing).permit(:description, :status, :city, :country, :address, :number_of_rooms, :rent, :min_stay, :private_room, :shared_room, :entire_house, :listing_name, :place_type, :state, :zipcode,  :tag_list, {images:[]})
	end
end

