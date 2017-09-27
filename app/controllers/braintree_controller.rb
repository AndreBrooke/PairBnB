class BraintreeController < ApplicationController
  def new
  	@listing = Listing.find(params[:listing_id])
  	@check_in = params[:check_in]
  	@check_out = params[:check_out]
  	@client_token = Braintree::ClientToken.generate
  end

  def checkout
  	booking = Booking.new
  	booking.check_in = params[:check_in].to_date
  	booking.check_out = params[:check_out].to_date
  	booking.user_id = current_user.id
  	booking.listing_id = params[:listing_id]
  	nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

  	result = Braintree::Transaction.sale(
  		:amount => "#{booking.total_cost}",
  		:payment_method_nonce => nonce_from_the_client,
  		:options => {
  			:submit_for_settlement => true
  			})

  	if result.success?
  		booking.save
      BookingJob.perform_now(booking)
  		redirect_to :root , :flash => {:success => "Transaction successful!"}
  	else
  		redirect_to braintree_new_path, :flash => {:error => "Transaction failed.Please try again."}
  	end
  end
end
