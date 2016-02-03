class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :fname
      t.string :lname
      t.datetime :birthday
      t.string :street_address
      t.string :state
      t.string :city
      t.integer :zip

      t.timestamps null: false
    end
  end
end
