class RemoveLongLatFromOrders < ActiveRecord::Migration
  def change
  	remove_column :orders , :latitude , :float
  	remove_column :orders , :longitude , :float
  end
end
