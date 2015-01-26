class AddColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :food_items, :string
  end
end
