class CustomersController < ApplicationController

 before_filter :authenticate_customer!

  def show
    @customer = current_customer
    @orders = Order.all
  end
end
