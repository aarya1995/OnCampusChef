class AddPlanToEndUsers < ActiveRecord::Migration
  def change
    add_column :end_users, :plan, :string
  end
end
