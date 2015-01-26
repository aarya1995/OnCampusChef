class OrdersController < ApplicationController
	before_filter :authenticate_customer!

	def new
		@order = Order.new
	end

	def create
		@order = current_customer.orders.build(order_params)

		if params[:athlete_button]
			@order.mealplan = "athlete"
			@order.group = "1"
		elsif params[:healthy_button]
			@order.mealplan = "healthy living"
			@order.group = "1"
		elsif params[:homestyle_button]
			@order.mealplan = "home style"
			@order.group = "1"
		elsif params[:budget_button]
			@order.mealplan = "budget"
			@order.group = "1"
		end

		if params[:athlete_group_button]
			@order.mealplan = "athlete"
		elsif params[:healthy_group_button]
			@order.mealplan = "healthy living"
		elsif params[:homestyle_group_button]
			@order.mealplan = "home style"
		elsif params[:budget_group_button]
			@order.mealplan = "budget"
		end

		respond_to do |format|

			if @order.save
				flash[:success] = "Order placed!"
				format.html { redirect_to '/profile' }
        		format.js
			else
				format.html { render action: 'new' }
		        
		        # added:
		        format.js   { render json: @order.errors, status: :unprocessable_entity }
			end
		end
	end

	def order_params
		params.require(:order).permit(:food_items)
	end
end

