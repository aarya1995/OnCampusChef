class AddAppointmentDateColumnToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :appointment_date, :date
  end
end
