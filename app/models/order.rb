class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :truck
  has_many :foodorders
  has_many :orderedfood , through: :foodorders , source: :food 
end
