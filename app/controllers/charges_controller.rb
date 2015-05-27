class ChargesController < ApplicationController
	before_filter :authenticate_customer!
	# Must put in sanity checks, user could manipulate POSTDATA

	def new
	  @PRICE_PER_MEAL = 1200
	  @amount = 0
	  @recent_order = Order.first(:order => 'id DESC')
	  @items = @recent_order.food_items
	  @items.each {|x| 
	  	x.each_value {|v|
	  		@amount = @amount + (v.to_i * @PRICE_PER_MEAL)
	  	}
	  }
	end

	def create
	  #if # stripe customer ID does not exist in database for this user
		  @PRICE_PER_MEAL = 1200
		  @amount = 0
		  @recent_order = Order.first(:order => 'id DESC')
		  if @recent_order.nil?
		  	raise "wtf lolz"
		  end
		 @items = @recent_order.food_items
		 @items.each {|x| 
		  	x.each_value {|v|
		  		@amount = @amount + (v.to_i * @PRICE_PER_MEAL)
		  	}
		  }

		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		# Create the charge on Stripe's servers - this will charge the user's card
		  charge = Stripe::Charge.create(
		    :amount => @amount, # amount in cents, again
		    :currency => "usd",
		    :source => token,
		    :description => "Example charge"
		  )

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to charges_path
		end

		if @recent_order != nil
			@recent_order.status = "paid"
			@recent_order.save
		else
			#raise "recent order not found"
		end
end
