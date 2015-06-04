class FoodObjectsController < ApplicationController

	def menu
		@food = FoodObject.all
		#@food = FoodObject.find(:all, :order => "id desc", :limit => 6)
	end

end
