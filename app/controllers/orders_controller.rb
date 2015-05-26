class OrdersController < ApplicationController

	 before_filter :authenticate_customer!
	 @tot_price = 0
	 @new_order = nil

	def new
		@food_items = FoodObject.all
		@tot_price = -1
	end

	def food_picker
		@food_items = FoodObject.all
	end

	def create
		@new_order = Order.new(order_params)
		@new_order.status = "pending"
		#@new_order.food_items = []
		params.each_pair{|k,v|
			if FoodObject.exists?(name: k)
				@new_order.food_items.push({k => v})
			end
		}

		respond_to do |format|

			if @new_order.save
				flash[:success] = "Order placed!"
				format.html { redirect_to '/profile' }
        		format.js
			else

			  format.html { render action: 'new' }
			        
			  # added: not working after adding redirects
			  format.js   { render json: @new_order.errors, status: :unprocessable_entity }
			end
		end
	end

	def order_params
		params.require(:order).permit(:contact_info, :address, :appointment_date)
	end

	def charge
	end
end