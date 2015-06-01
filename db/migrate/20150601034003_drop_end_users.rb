class DropEndUsers < ActiveRecord::Migration
  def change
  	drop_table :end_users
  end
end
