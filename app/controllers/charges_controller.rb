class ChargesController < ApplicationController
    before_filter :authenticate_customer!
    # Must put in sanity checks, user could manipulate POSTDATA

    def new
      @recent_order = Order.where("customer_id = #{current_customer.id}").first(:order => 'id DESC')
      
      @numMeals = @recent_order.num_meals

    
      if @numMeals.to_i == 8
        @finalCost = 10264
      elsif @numMeals.to_i == 10
        @finalCost = 12570
      elsif @numMeals.to_i == 12
        @finalCost = 14772
      elsif @numMeals.to_i == 14
        @finalCost = 16870
      elsif @numMeals.to_i == 16
        @finalCost = 18864
      elsif @numMeals.to_i == 18
        @finalCost = 20754
      elsif @numMeals.to_i == 20
        @finalCost = 22540
      elsif @numMeals.to_i == 22
        @finalCost = 24222
      elsif @numMeals.to_i == 24
        @finalCost = 25800
      elsif @numMeals.to_i == 26
        @finalCost = 27274
      elsif @numMeals.to_i == 28
        @finalCost = 28644
      elsif @numMeals.to_i == 30
        @finalCost = 29910
      elsif @numMeals.to_i == 40
        @finalCost = 39560
      end

      @items = @recent_order.food_items

      # Apply promo code

      if @recent_order.promo_code == "healthy123" && @recent_order.num_meals.to_i > 8
        @discountedPrice = @finalCost - (@finalCost * 0.10)
        # Add sales tax # 
        @afterTax = (@discountedPrice * 0.06) + @discountedPrice #this is the final cost
      else 
        @afterTax = (@finalCost * 0.06) + @finalCost #this is the final cost
      end

     
    end

    def create
      #if # stripe customer ID does not exist in database for this user
      # Calculating cost of order #
      @recent_order = Order.where("customer_id = #{current_customer.id}").first(:order => 'id DESC')
      
      @numMeals = @recent_order.num_meals

      if @numMeals.to_i == 8
        @finalCost = 10264
      elsif @numMeals.to_i == 10
        @finalCost = 12570
      elsif @numMeals.to_i == 12
        @finalCost = 14772
      elsif @numMeals.to_i == 14
        @finalCost = 16870
      elsif @numMeals.to_i == 16
        @finalCost = 18864
      elsif @numMeals.to_i == 18
        @finalCost = 20754
      elsif @numMeals.to_i == 20
        @finalCost = 22540
      elsif @numMeals.to_i == 22
        @finalCost = 24222
      elsif @numMeals.to_i == 24
        @finalCost = 25800
      elsif @numMeals.to_i == 26
        @finalCost = 27274
      elsif @numMeals.to_i == 28
        @finalCost = 28644
      elsif @numMeals.to_i == 30
        @finalCost = 29910
      elsif @numMeals.to_i == 40
        @finalCost = 39560
      end

      # end calculation #

       # Apply promo code
      if @recent_order.promo_code == "healthy123" && @recent_order.num_meals.to_i > 8
        @discountedPrice = @finalCost - (@finalCost * 0.10)

        # Add sales tax # 
        @afterTax = (@discountedPrice * 0.06) + @discountedPrice #this is the final cost
      else 
        @afterTax = (@finalCost * 0.06) + @finalCost #this is the final cost
      end
        
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