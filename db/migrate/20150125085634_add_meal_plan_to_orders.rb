class AddMealPlanToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :mealplan, :string
  end
end
