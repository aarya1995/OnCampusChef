class AddMealplanToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :mealplan, index: true
  end
end
