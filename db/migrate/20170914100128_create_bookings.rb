class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
    t.belongs_to :user, foreign_key: true
    t.belongs_to :listing, foreign_key: true
    t.datetime :check_in
    t.datetime :check_out

    t.timestamps
    end
  end
end
