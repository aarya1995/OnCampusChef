class AddGroupToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :group, :string
  end
end
