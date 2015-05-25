class RemoveGroupFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :group, :string
  end
end
