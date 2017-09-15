class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.belongs_to :user, foreign_key: true
      t.string :description
      t.string :status
      t.string :city
      t.string :country
      t.string :address
      t.integer :rent
      t.integer :room_type
      t.integer :number_of_rooms
      t.integer :min_stay

      t.timestamps
    end
  end
end
