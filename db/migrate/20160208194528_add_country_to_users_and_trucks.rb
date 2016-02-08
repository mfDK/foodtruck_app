class AddCountryToUsersAndTrucks < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :trucks , :country , :string
  end
end
