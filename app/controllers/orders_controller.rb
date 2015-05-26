class OrdersController < ApplicationController

	 before_filter :authenticate_customer!
	

	def new
		@food_items = FoodObject.all
		@tot_price = 0

	end

	def food_picker
		@food_items = FoodObject.all
	end

	def price
	end

	def 

	def create
		@order = Order.new(order_params)
	end

	def order_params
		params.require(:order).permit(:food_items, :contact_info, :address, :appointment_date, :status)
	end



end