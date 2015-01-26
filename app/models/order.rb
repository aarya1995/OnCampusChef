class Order < ActiveRecord::Base

	belongs_to :customer
	
	validates :food_items, presence: true
	validates :group, presence: true
end
