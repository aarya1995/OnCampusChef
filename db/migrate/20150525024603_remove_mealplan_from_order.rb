class RemoveMealplanFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :mealplan, :string
  end
end
