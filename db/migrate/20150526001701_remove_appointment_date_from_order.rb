class RemoveAppointmentDateFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :appointment_date, :date
  end
end
