class OrdersController < ApplicationController
	before_filter :authenticate_customer!

	def new
		@order = Order.new
	end

	def create
		@order = current_customer.orders.build(order_params)

		if $mealplan.eql? "athlete"
			@order.mealplan = "athlete"
		elsif $mealplan.eql? "healthyliving"
			@order.mealplan = "healthyliving"
		elsif $mealplan.eql? "homestyle"
			@order.mealplan = "homestyle"
		elsif $mealplan.eql? "budget"
			@order.mealplan = "budget"
		elsif $mealplan.eql? "vegetarian"
			@order.mealplan = "vegetarian"
	    end 

		respond_to do |format|

			if @order.save
				flash[:success] = "Order placed!"
				format.html { redirect_to '/profile' }
        		format.js
			else
	            format.html { render action: 'new' }
			        
			    # added: not working after adding redirects
			    format.js   { render json: @order.errors, status: :unprocessable_entity }
			   
			end
		end
	end

	def athlete
		$mealplan = "athlete"
	end

	def healthyliving
		$mealplan = "healthyliving"
	end

	def homestyle
		$mealplan = "homestyle"
	end

	def budget
		$mealplan = "budget"
	end

	def vegetarian
		$mealplan = "vegetarian"
	end

	def order_params
		params.require(:order).permit(:food_items, :group, :contact_info)
	end
end

