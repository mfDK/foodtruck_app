class AddLatitudeAndLongitudeToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :latitude, :float
    add_column :trucks, :longitude, :float
  end
end
