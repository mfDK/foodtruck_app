class CreateFoodorders < ActiveRecord::Migration
  def change
    create_table :foodorders do |t|
      t.references :order, index: true, foreign_key: true
      t.references :food, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
