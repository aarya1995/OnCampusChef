class RemoveFoodItemsFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :food_items, :Array
  end
end
