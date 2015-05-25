class OrdersController < ApplicationController
	@num_meals = 0

	def new
	end

	def order
		@food_items = FoodObject.all
	end

end