class AddAddOnsColumnToBarbecueOrders < ActiveRecord::Migration
  def change
    add_column :barbecue_orders, :add_ons, :text
  end
end
