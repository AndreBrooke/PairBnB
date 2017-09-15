class User < ApplicationRecord
  include Clearance::User
  has_many :bookings
  has_many :reviews
end
