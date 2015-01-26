class RemoveMealPlanFromOrders < ActiveRecord::Migration
  def change
    remove_reference :orders, :mealplan, index: true
  end
end
