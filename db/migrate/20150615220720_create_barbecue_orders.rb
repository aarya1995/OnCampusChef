class CreateBarbecueOrders < ActiveRecord::Migration
  def change
    create_table :barbecue_orders do |t|
      t.text :package_number

      t.timestamps
    end
  end
end
