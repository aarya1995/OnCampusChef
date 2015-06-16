class AddCustomerToBarbecueOrders < ActiveRecord::Migration
  def change
    add_reference :barbecue_orders, :customer, index: true
  end
end
