class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.belongs_to :user, foreign_key: true
      t.string :description
      t.string :status
      t.string :country
      t.string :state
      t.string :zipcode
      t.string :city
      t.string :address

      t.integer :rent
      t.integer :number_of_rooms
      t.integer :min_stay
      t.boolean :private_room
      t.boolean :shared_room
      t.boolean :entire_house
      t.string :listing_name
      t.integer :place_type

      t.timestamps
    end
  end
end
