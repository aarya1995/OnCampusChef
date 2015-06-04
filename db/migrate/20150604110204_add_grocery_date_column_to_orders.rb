class AddGroceryDateColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :grocery_date, :text
  end
end
