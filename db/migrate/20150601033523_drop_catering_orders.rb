class DropCateringOrders < ActiveRecord::Migration
  def change
  	drop_table :catering_orders
  end
end
