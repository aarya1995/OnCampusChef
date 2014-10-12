class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phonenumber
      t.string :address
      t.string :email
      t.string :mealplan
      t.text :feedback
      t.integer :mealquantity
      t.text :constraints

      t.timestamps
    end
  end
end
