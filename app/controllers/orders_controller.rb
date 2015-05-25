class OrdersController < ApplicationController

	def order
		@food_items = FoodObject.all
	end

end