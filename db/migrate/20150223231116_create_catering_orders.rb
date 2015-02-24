class CreateCateringOrders < ActiveRecord::Migration
  def change
    create_table :catering_orders do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :availability
      t.string :address
      t.string :organization

      t.timestamps
    end
  end
end
