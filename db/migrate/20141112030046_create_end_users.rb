class CreateEndUsers < ActiveRecord::Migration
  def change
    create_table :end_users do |t|
      t.string :name
      t.string :phonenumber
      t.string :address
      t.string :email
      t.string :mealplan

      t.timestamps
    end
  end
end
