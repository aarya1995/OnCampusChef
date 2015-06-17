class AddColumnsToBarbecueOrder < ActiveRecord::Migration
  def change
  	#add columns here
  	add_column :barbecue_orders, :appointment_date, :text
  	add_column :barbecue_orders, :grocery_date, :text
  	add_column :barbecue_orders, :contact_info, :string
  	add_column :barbecue_orders, :address, :string
  	add_column :barbecue_orders, :status, :string
  	add_column :barbecue_orders, :promo_code, :string
  end
end
