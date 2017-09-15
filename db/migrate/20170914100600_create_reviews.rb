class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
   	t.belongs_to :listing, foreign_key: true
    t.belongs_to :user, foreign_key: true
    t.string :comments
    t.integer :score

    t.timestamps
    end
  end
end
