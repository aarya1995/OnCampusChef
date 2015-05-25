class AddFoodItemsColumnToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :food_items, :text
  end
end
