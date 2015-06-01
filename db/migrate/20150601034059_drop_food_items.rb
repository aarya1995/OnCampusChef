class DropFoodItems < ActiveRecord::Migration
  def change
  	drop_table :food_items
  end
end
