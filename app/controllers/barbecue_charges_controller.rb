class BarbecueChargesController < ApplicationController
	before_filter :authenticate_customer!

	def new
		@recent_order =  BarbecueOrder.where("customer_id = #{current_customer.id}").first(:order => 'id DESC')

		if @recent_order.package_number.to_i == 1
			@finalCost = 48680
		elsif @recent_order.package_number.to_i == 2
			@finalCost = 42080
		elsif @recent_order.package_number.to_i == 3
			@finalCost = 35480
		elsif @recent_order.package_number.to_i == 4
			@finalCost = 28880
		elsif @recent_order.package_number.to_i == 5
			@finalCost = 19400
		end

		@afterTax = (@finalCost * 0.06) + @finalCost #this is the final cost
	end

	def create

		@recent_order =  BarbecueOrder.where("customer_id = #{current_customer.id}").first(:order => 'id DESC')

		if @recent_order.package_number.to_i == 1
			@finalCost = 48680
		elsif @recent_order.package_number.to_i == 2
			@finalCost = 42080
		elsif @recent_order.package_number.to_i == 3
			@finalCost = 35480
		elsif @recent_order.package_number.to_i == 4
			@finalCost = 28880
		elsif @recent_order.package_number.to_i == 5
			@finalCost = 19400
		end

		@afterTax = (@finalCost * 0.06) + @finalCost #this is the final cost

		# Get the credit card details submitted by the form
        token = params[:stripeToken]

        # Create the charge on Stripe's servers - this will charge the user's card
        begin
        charge = Stripe::Charge.create(
            :amount => @afterTax.to_i, # amount in cents, again
            :currency => "usd",
            :source => token,
            :description => "Real charge"
        )

        if charge != nil
            if @recent_order != nil    
                if charge["paid"] then @recent_order.status = "paid" end
                @recent_order.save
                flash[:success] = "Order placed!"
                redirect_to "/profile"
            else
                raise "Something got fucked up with the order"
                @recent_order = BarbecueOrder.first(:order => 'id DESC')
                @recent_order.status = "paid" if charge["paid"]
                @recent_order.save
            end
        end

        rescue Stripe::CardError => e
          flash[:error] = e.message
          redirect_to barbecue_charges_path
        end

	end
end
