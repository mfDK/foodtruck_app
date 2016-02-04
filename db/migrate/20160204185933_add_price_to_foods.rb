class AddPriceToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :price, :decimal
  end
end
