class AddAppointmentDateColumnToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :appointment_date, :text
  end
end
