class AddNumMealsColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :num_meals, :text
  end
end
