class OrdersController < ApplicationController

	before_filter :authenticate_customer!
	def index
	end

	def new
		@food_items = FoodObject.all
	end

	def create
		@food_items = FoodObject.all
		@amount = 0

		@new_order = Order.new()#(order_params)
		@new_order.status = "unpaid"
		@new_order.food_items = []
		params.each_pair{|k,v|
			if FoodObject.exists?(name: k)
				@new_order.food_items.push({k => v})
				@amount = @amount + v.to_i
			elsif k == "contact_info"
				@new_order.contact_info = v
			elsif k == "address"
				@new_order.address = v
			elsif k == "appointment_date"
				@new_order.appointment_date = v
			end
		}

		@new_order.customer_id = current_customer.id

		respond_to do |format|
			if @amount = 0
				flash[:error] = "Error: Cannot Order 0 Meals!"
				format.html { render action: 'new' }
			else
				if @new_order.save
					format.html { redirect_to '/charges/new' }
	        		format.js
				else
				  format.html { render action: 'new' }
				        
				  # added: not working after adding redirects
				  format.js   { render json: @new_order.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	#### Implement this shit later... its the real way
	# def order_params		
	# 	params.require(:order).permit(:contact_info, :address, :appointment_date)
	# end
end