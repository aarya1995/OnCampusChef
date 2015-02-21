class OrdersController < ApplicationController
	before_filter :authenticate_customer!

	def new
		@order = Order.new
	end

	def create
		@order = current_customer.orders.build(order_params)

		if params[:athlete_button]
			@order.mealplan = "athlete"
			
		elsif params[:healthy_button]
			@order.mealplan = "healthy living"
			
		elsif params[:homestyle_button]
			@order.mealplan = "home style"
			
		elsif params[:budget_button]
			@order.mealplan = "budget"
		elsif params[:vegetarian_button]
			@order.mealplan = "vegetarian"
			
		end


		respond_to do |format|

			if @order.save
				flash[:success] = "Order placed!"
				format.html { redirect_to '/profile' }
        		format.js
			else

				if @order.mealplan.eql? "athlete"	
					format.html { redirect_to new_athlete_path }
			        
			        # added: not working after adding redirects
			        format.js   { render json: @order.errors, status: :unprocessable_entity }
			    elsif @order.mealplan.eql? "budget"	
					format.html { redirect_to new_budget_path }
			        
			        # added: not working after adding redirects
			        format.js   { render json: @order.errors, status: :unprocessable_entity }
			    elsif @order.mealplan.eql? "home style"	
					format.html { redirect_to new_homestyle_path }
			        
			        # added:
			        format.js   { render json: @order.errors, status: :unprocessable_entity }
			    elsif @order.mealplan.eql? "healthy living"	
					format.html { redirect_to new_healthy_living_path }
			        
			        # added:
			        format.js   { render json: @order.errors, status: :unprocessable_entity }
			    end
			end
		end
	end

	def order_params
		params.require(:order).permit(:food_items, :group, :contact_info)
	end
end

