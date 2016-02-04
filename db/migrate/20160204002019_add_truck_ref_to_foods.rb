class AddTruckRefToFoods < ActiveRecord::Migration
  def change
    add_reference :foods, :truck, index: true, foreign_key: true
  end
end
