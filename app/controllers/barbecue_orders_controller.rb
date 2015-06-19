class BarbecueOrdersController < ApplicationController

	before_filter :authenticate_customer!

	def new
	end

	def create
		
		@bbqOrder = BarbecueOrder.new()

		@bbqOrder.customer_id = current_customer.id

		@bbqOrder.status = "unpaid"

		params.each_pair{|k,v|
			if k == "package_number"
				@bbqOrder.package_number = v
			elsif k == "contact_info"
				@bbqOrder.contact_info = v
			elsif k == "address"
				@bbqOrder.address = v
			elsif k == "chef_date"
				@bbqOrder.appointment_date = v
			elsif k == "grocery_date"
				@bbqOrder.grocery_date = v
			end
		}


		respond_to do |format|
			if @bbqOrder.save
			format.html { redirect_to '/barbecue_charges/new' }
			       	 format.js
			else
			 format.html { render action: 'new' }
			       
			 # added: not working after adding redirects
			 format.js   { render json: @bbqOrder.errors, status: :unprocessable_entity }
			end
		end
	end
end
