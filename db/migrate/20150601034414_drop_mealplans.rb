class DropMealplans < ActiveRecord::Migration
  def change
  	drop_table :mealplans
  end
end
