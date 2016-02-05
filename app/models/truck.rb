class Truck < ActiveRecord::Base
	has_many :foods
	has_many :orders
	# This is from the orders table, possibly need to
	# made a has_many :through **
end
