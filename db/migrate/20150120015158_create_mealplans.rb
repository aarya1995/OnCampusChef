class CreateMealplans < ActiveRecord::Migration
  def change
    create_table :mealplans do |t|
      t.string :name

      t.timestamps
    end
  end
end
