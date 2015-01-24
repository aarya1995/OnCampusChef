class AddCustomernameToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :customername, :string
  end
end
