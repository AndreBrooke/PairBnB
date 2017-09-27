class BookingJob < ApplicationJob
  queue_as :default
  
  def perform(booking)
    BookingMailer.booking_email(booking).deliver_later
  end
end
