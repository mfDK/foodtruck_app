class RemoveItemColumnsFromOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :item1, :string
  	remove_column :orders, :item2, :string
  	remove_column :orders, :item3, :string
  	remove_column :orders, :item4, :string
  	remove_column :orders, :item5, :string
  	remove_column :orders, :item6, :string
  	remove_column :orders, :item7, :string
  	remove_column :orders, :item8, :string
  	remove_column :orders, :item9, :string
  	remove_column :orders, :item10, :string
  end
end
