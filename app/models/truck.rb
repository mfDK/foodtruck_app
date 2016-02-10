class Truck < ActiveRecord::Base
	has_many :foods
	has_many :orders
	belongs_to :user
	validates :name , uniqueness: true
	validates_presence_of :street_address , :state,:city,:zip,:country
	# This is from the orders table, possibly need to
	# made a has_many :through **
	# has_many :food_ordered , through: :orders , source: :truck

	# This is using the address method to use the attributes of the user model
	# to get a full address as a string. 
	geocoded_by :address
	after_validation :geocode
	# using Obj.geocode gives a longitude latitude coordinates of current location

	def address
		[street_address,city, state, zip, country].compact.join(", ")
	end

	# checks to see if an address has been changed/updated or is present before using geocode
	after_validation :geocode, if: ->(obj){ obj.street_address.present? and obj.state.present? and obj.city.present? and obj.zip.present? and obj.street_address_changed? and obj.state_changed? and obj.city_changed? and obj.zip_changed?}
end
