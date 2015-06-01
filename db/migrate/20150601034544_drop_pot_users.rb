class DropPotUsers < ActiveRecord::Migration
  def change
  	drop_table :pot_users
  end
end
