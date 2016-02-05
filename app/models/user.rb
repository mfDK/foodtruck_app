class User < ActiveRecord::Base
	has_secure_password
	validates_confirmation_of :password 
	validates_presence_of :password , on: :create
	has_many :orders
	# This is from the orders table, possibly need to
	# made a has_many :through **

	geocoded_by :address

	# checks to see if an address has been changed/updated or is present before using geocode
	after_validation :geocode, if: ->(obj){ obj.street_address.present? and obj.state.present? and obj.city.present? and obj.zip.present? and obj.street_address_changed? and obj.state_changed? and obj.city_changed? and obj.zip_changed?}

	def address
		[city, state, zip, street_address].compact.join(",")
	end

end
