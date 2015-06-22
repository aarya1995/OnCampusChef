class BarbecueOrder < ActiveRecord::Base
	validates :package_number, presence: true
	belongs_to :customer
	serialize :add_ons, Array
end
