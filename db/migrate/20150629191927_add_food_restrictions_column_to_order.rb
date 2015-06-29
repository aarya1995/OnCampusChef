class AddFoodRestrictionsColumnToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :food_restrictions, :string
  end
end
