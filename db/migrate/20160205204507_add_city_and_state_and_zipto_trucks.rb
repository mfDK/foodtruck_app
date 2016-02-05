class AddCityAndStateAndZiptoTrucks < ActiveRecord::Migration
  def change
  	add_column :trucks, :city, :string
  	add_column :trucks, :state, :string
  	add_column :trucks, :zip, :integer
  end
end
