class CustomersController < ApplicationController

 before_filter :authenticate_customer!

  def show
    @customer = current_customer
    @orders = Order.order(created_at: :desc).where(customer_id: @customer.id).all
    @bbqOrders = BarbecueOrder.order(created_at: :desc).where(customer_id: @customer.id).all
  end
end
