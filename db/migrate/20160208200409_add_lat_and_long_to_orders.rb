class AddLatAndLongToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :latitude, :float
  	add_column :orders, :longitude, :float
  end
end
