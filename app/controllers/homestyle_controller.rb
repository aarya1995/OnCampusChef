class HomestyleController < ApplicationController
	before_filter :authenticate_customer!

	def new
		@order = Order.new
	end

	def create
		@order = current_customer.orders.build(order_params)
		@order.mealplan = "homestyle"

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
		params.require(:order).permit(:food_items, :group, :contact_info)
	end
end
