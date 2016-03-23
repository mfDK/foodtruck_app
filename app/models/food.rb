class Food < ActiveRecord::Base
	belongs_to :truck
	has_many :foodorders
	has_many :foodordered , through: :foodorders , source: :order
end
