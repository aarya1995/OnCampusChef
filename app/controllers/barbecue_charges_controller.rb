class BarbecueChargesController < ApplicationController
	before_filter :authenticate_customer!

	def new
		@recent_order =  BarbecueOrder.where("customer_id = #{current_customer.id}").first(:order => 'id DESC')
		
		#calculating core cost before addons
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
		
		@addonCost = 0
		#calculating cost after taking addons into account
		@recent_order.add_ons.each { |addon|
			
			if addon == "shrimp1"
				@addonCost = @addonCost + 80
			elsif addon == "shrimp2"
				@addonCost = @addonCost + 56
			elsif addon == "shrimp3"
				@addonCost = @addonCost + 40
			elsif addon == "shrimp4"
				@addonCost = @addonCost + 24
			elsif addon == "beefkabob1"
				@addonCost = @addonCost + 56
			elsif addon == "beefkabob2"
				@addonCost = @addonCost + 32
			elsif addon == "beefkabob3"
				@addonCost = @addonCost + 24
			elsif addon == "beefkabob4"
				@addonCost = @addonCost + 16
			elsif addon == "lambkabob1"
				@addonCost = @addonCost + 64
			elsif addon == "lambkabob2"
				@addonCost = @addonCost + 51
			elsif addon == "lambkabob3"
				@addonCost = @addonCost + 38
			elsif addon == "lambkabob4"
				@addonCost = @addonCost + 26
			elsif addon == "meatball1"
				@addonCost = @addonCost + 60
			elsif addon == "meatball2"
				@addonCost = @addonCost + 45
			elsif addon == "meatball3"
				@addonCost = @addonCost + 30
			elsif addon == "meatball4"
				@addonCost = @addonCost + 19
			elsif addon == "burger1"
				@addonCost = @addonCost + 56
			elsif addon == "burger2"
				@addonCost = @addonCost + 42
			elsif addon == "burger3"
				@addonCost = @addonCost + 28
			elsif addon == "burger4"
				@addonCost = @addonCost + 14
			end
				
		}

		@addonCost = @addonCost * 100
		
		@finalfinal = @finalCost + @addonCost
		@afterTax = (@finalfinal * 0.06) + @finalfinal #this is the final cost
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

		@addonCost = 0
		#calculating cost after taking addons into account
		@recent_order.add_ons.each { |addon|
			
			if addon == "shrimp1"
				@addonCost = @addonCost + 80
			elsif addon == "shrimp2"
				@addonCost = @addonCost + 56
			elsif addon == "shrimp3"
				@addonCost = @addonCost + 40
			elsif addon == "shrimp4"
				@addonCost = @addonCost + 24
			elsif addon == "beefkabob1"
				@addonCost = @addonCost + 56
			elsif addon == "beefkabob2"
				@addonCost = @addonCost + 32
			elsif addon == "beefkabob3"
				@addonCost = @addonCost + 24
			elsif addon == "beefkabob4"
				@addonCost = @addonCost + 16
			elsif addon == "lambkabob1"
				@addonCost = @addonCost + 64
			elsif addon == "lambkabob2"
				@addonCost = @addonCost + 51
			elsif addon == "lambkabob3"
				@addonCost = @addonCost + 38
			elsif addon == "lambkabob4"
				@addonCost = @addonCost + 26
			elsif addon == "meatball1"
				@addonCost = @addonCost + 60
			elsif addon == "meatball2"
				@addonCost = @addonCost + 45
			elsif addon == "meatball3"
				@addonCost = @addonCost + 30
			elsif addon == "meatball4"
				@addonCost = @addonCost + 19
			elsif addon == "burger1"
				@addonCost = @addonCost + 56
			elsif addon == "burger2"
				@addonCost = @addonCost + 42
			elsif addon == "burger3"
				@addonCost = @addonCost + 28
			elsif addon == "burger4"
				@addonCost = @addonCost + 14
			end
				
		}
		
		@addonCost = @addonCost * 100
		@finalfinal = @finalCost + @addonCost
		@afterTax = (@finalfinal * 0.06) + @finalfinal #this is the final cost

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
