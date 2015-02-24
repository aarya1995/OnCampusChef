class CateringOrdersController < ApplicationController
	def new
		@catOrder = CateringOrder.new
	end

	def create
		@catOrder = CateringOrder.new(catOrder_params)
		respond_to do |format|

			if @catOrder.save
				flash[:success] = "Order placed!"
				format.html { redirect_to '/catering' }
        		format.js
			else

			  format.html { render action: 'new' }
			        
			  # added: not working after adding redirects
			  format.js   { render json: @catOrder.errors, status: :unprocessable_entity }
			end
		end
	end

	def catOrder_params
		params.require(:catering_order).permit(:name, :email, :phone, :availability, :address, :organization)
	end
end
