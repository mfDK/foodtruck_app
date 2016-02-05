class User < ActiveRecord::Base
	has_secure_password
	validates_confirmation_of :password 
	validates_presence_of :password , on: :create
	has_many :orders
	# This is from the orders table, possibly need to
	# made a has_many :through **
end
