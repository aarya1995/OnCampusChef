class RemoveOrderDateFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :order_date, :datetime
  end
end
