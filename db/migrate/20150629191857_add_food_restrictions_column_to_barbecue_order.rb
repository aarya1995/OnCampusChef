class AddFoodRestrictionsColumnToBarbecueOrder < ActiveRecord::Migration
  def change
    add_column :barbecue_orders, :food_restrictions, :string
  end
end
