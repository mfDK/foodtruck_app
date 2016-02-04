class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
    	t.string :food_name
    	t.string :description

    	t.timestamps null: false
    end
  end
end
