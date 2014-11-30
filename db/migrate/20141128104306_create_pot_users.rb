class CreatePotUsers < ActiveRecord::Migration
  def change
    create_table :pot_users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :basicinfo

      t.timestamps
    end
  end
end
