class FoodObjectsController < ApplicationController

	def menu
		@food = FoodObject.all
		
	end

end
