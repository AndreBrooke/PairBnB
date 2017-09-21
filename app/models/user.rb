class User < ApplicationRecord
  attr_accessor :avatar
  include Clearance::User
  has_many :bookings
  has_many :reviews
  has_many :authentications, dependent: :destroy
  has_many :listings
  enum role: { :customer => 0, :moderator => 1, :superadmin => 2 }
  enum gender: {:male => 0, :female => 1}
  mount_uploader :avatar, AvatarUploader

  

    def self.create_with_auth_and_hash(authentication, auth_hash)
      user = self.create!(
        first_name: auth_hash["extra"]["raw_info"]["first_name"],
        last_name: auth_hash["extra"]["raw_info"]["last_name"],
        email: auth_hash["extra"]["raw_info"]["email"],
        password: SecureRandom.hex(10)
      )
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end
end
