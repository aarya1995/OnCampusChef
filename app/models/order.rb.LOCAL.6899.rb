class Order < ActiveRecord::Base

	belongs_to :customer

	serialize :food_items, Array

end
