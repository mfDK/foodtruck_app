class AddUserReferenceToTrucksTable < ActiveRecord::Migration
  def change
    add_reference :trucks, :user, index: true, foreign_key: true
  end
end
