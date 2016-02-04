class AddTruckOwnerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :truck_owner, :boolean , default: false
  end
end
