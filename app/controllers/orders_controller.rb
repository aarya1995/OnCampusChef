class OrdersController < ApplicationController

	
	before_filter :authenticate_customer!

	def index
	end

	def quantity

	end

	def new
		@quantity = params[:quantity]
		@order = Order.new() # without the parantheses! (order_params)
		@order.num_meals = @quantity
		@order.customer_id = current_customer.id
		@order.save

		#determine how many meals the customer can select
		if @quantity.to_i == 8 || @quantity.to_i == 10 || @quantity.to_i == 12
			@howMany = 3
		elsif @quantity.to_i == 14 || @quantity.to_i == 16
			@howMany = 4
		else
			@howMany = 5 # this shouldn't be the default case
		end

		@food_items = FoodObject.all
		#@food_items = FoodObject.find(:all, :order => "id desc", :limit => 6)
	end

	def create
		@food_items = FoodObject.all
		@amount = 0

		@new_order = Order.where("customer_id = #{current_customer.id}").first(:order => 'id DESC')
		@new_order.status = "unpaid"
		@new_order.food_items = []
		params.each_pair{|k,v|
			if FoodObject.exists?(name: v)
				@new_order.food_items.push(v)
				@amount = @amount + 1
			elsif k == "contact_info"
				@new_order.contact_info = v
			elsif k == "address"
				@new_order.address = v
			elsif k == "chef_date"
				@new_order.appointment_date = v
			elsif k == "grocery_date"
				@new_order.grocery_date = v
			elsif k == "promocode"
				@new_order.promo_code = v
			end
		}

		#@new_order.customer_id = current_customer.id

		# error checking #
		if @new_order.num_meals.to_i == 8 || @new_order.num_meals.to_i == 10 || @new_order.num_meals.to_i == 12
			@howMany = 3
		elsif @new_order.num_meals.to_i == 14 || @new_order.num_meals.to_i == 16
			@howMany = 4
		else
			@howMany = 5
		end

		# end error check #

		respond_to do |format|
			if @amount <= 0 || @amount > @howMany
				flash[:error] = "Error: Must Order Up To #{ @howMany } Meals!"
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
end