class AddColumnToFoodItem < ActiveRecord::Migration
  def change
    add_reference :food_items, :mealplan_id, index: true
  end
end
