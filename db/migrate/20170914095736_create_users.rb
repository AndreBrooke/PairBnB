class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.datetime :last_login_at
      t.datetime :current_login_at

      t.timestamps
    end
  end
end
