# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user= {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
	20.times do
		user['first_name']= Faker::Name.first_name
		user['last_name']= Faker::Name.last_name
		user['email'] = Faker::Internet.email
		user['gender'] = rand(1..2)
		user['phone'] = Faker::PhoneNumber.phone_number
		user['country'] = Faker::Address.country
		user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)

		User.create(user)
	end
end

listing = {}
uids = []
User.all.each { |u| uids << u.id}

ActiveRecord::Base.transaction do 
	40.times do
		listing['listing_name'] = Faker::App.name
		listing['place_type'] = rand(1..3)
		listing['number_of_rooms'] = rand(1..6)
		listing['min_stay'] = rand(1..14)

		listing['country'] = Faker::Address.country
		listing['state'] = Faker::Address.state
		listing['city'] = Faker::Address.city
		listing['zipcode'] = Faker::Address.zip_code
		listing['address'] = Faker::Address.street_address

		listing['rent'] = rand(80..500)
		listing['description'] = Faker::Hipster.sentence

		listing['user_id'] = uids.sample

		Listing.create(listing)
	end
end