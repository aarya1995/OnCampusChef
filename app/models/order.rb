class Order < ActiveRecord::Base

	belongs_to :customer
	
	validates :food_items, presence: true
	validates :group, presence: true
	validates :contact_info, presence: true
end
