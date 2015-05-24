class CreateFoodObjects < ActiveRecord::Migration
  def change
    create_table :food_objects do |t|
      t.string :name
      t.integer :price
      t.string :nutritional
      t.string :imageurl
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
