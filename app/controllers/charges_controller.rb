class ChargesController < ApplicationController
	@amount = 0
	def new

	end

	def create


	  # Amount in cents
	  @amount = 500 # Need to figure out how to make this a variable amount

	  #if # stripe customer ID does not exist in database for this user
		  customer = Stripe::Customer.create(
		    :email => 'example@stripe.com',
		    :card  => params[:stripeToken]
		  )

		# save_stripe_customer_id(user, customer.id)
	  #else
	  	# customer_id = get_stripe_customer_id(user)
	  #end

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
end
