class ChargesController < ApplicationController
    before_filter :authenticate_customer!
    # Must put in sanity checks, user could manipulate POSTDATA

    def new
      @recent_order = Order.where("customer_id = #{current_customer.id}").first(:order => 'id DESC')
      
      @numMeals = @recent_order.num_meals

      if @numMeals.to_i == 2
        @finalCost = 7455
      elsif @numMeals.to_i == 4
        @finalCost = 9275
      elsif @numMeals.to_i == 6
        @finalCost = 9695
      elsif @numMeals.to_i == 8
        @finalCost = 12075
      elsif @numMeals.to_i == 10
        @finalCost = 12600
      elsif @numMeals.to_i == 12
        @finalCost = 13125
      elsif @numMeals.to_i == 14
        @finalCost = 16450
      elsif @numMeals.to_i == 16
        @finalCost = 16975
      elsif @numMeals.to_i == 18
        @finalCost = 19775
      elsif @numMeals.to_i == 20
        @finalCost = 20300
      elsif @numMeals.to_i == 22
        @finalCost = 23100
      elsif @numMeals.to_i == 24
        @finalCost = 23625
      elsif @numMeals.to_i == 26
        @finalCost = 26425
      elsif @numMeals.to_i == 28
        @finalCost = 26950
      elsif @numMeals.to_i == 30
        @finalCost = 29750
      end

      @items = @recent_order.food_items

      # Add sales tax #

      @afterTax = (@finalCost * 0.06) + @finalCost #this is the final cost
     
    end

    def create
      #if # stripe customer ID does not exist in database for this user
      # Calculating cost of order #
      @recent_order = Order.where("customer_id = #{current_customer.id}").first(:order => 'id DESC')
      
      @numMeals = @recent_order.num_meals

      if @numMeals.to_i == 2
        @finalCost = 7455
      elsif @numMeals.to_i == 4
        @finalCost = 9275
      elsif @numMeals.to_i == 6
        @finalCost = 9695
      elsif @numMeals.to_i == 8
        @finalCost = 12075
      elsif @numMeals.to_i == 10
        @finalCost = 12600
      elsif @numMeals.to_i == 12
        @finalCost = 13125
      elsif @numMeals.to_i == 14
        @finalCost = 16450
      elsif @numMeals.to_i == 16
        @finalCost = 16975
      elsif @numMeals.to_i == 18
        @finalCost = 19775
      elsif @numMeals.to_i == 20
        @finalCost = 20300
      elsif @numMeals.to_i == 22
        @finalCost = 23100
      elsif @numMeals.to_i == 24
        @finalCost = 23625
      elsif @numMeals.to_i == 26
        @finalCost = 26425
      elsif @numMeals.to_i == 28
        @finalCost = 26950
      elsif @numMeals.to_i == 30
        @finalCost = 29750
      end

      # end calculation #

      # Add sales tax #

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
                @recent_order = Order.first(:order => 'id DESC')
                @recent_order.status = "paid" if charge["paid"]
                @recent_order.save
            end
        end

        rescue Stripe::CardError => e
          flash[:error] = e.message
          redirect_to charges_path
        end
    end
end