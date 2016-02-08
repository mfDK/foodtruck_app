class AddStreetAddressToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :street_address, :string
  end
end
