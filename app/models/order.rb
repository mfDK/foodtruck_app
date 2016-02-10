class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :truck
  validates_presence_of :food
end
