class Truck < ActiveRecord::Base
	has_many :foods
	has_many :orders
end
