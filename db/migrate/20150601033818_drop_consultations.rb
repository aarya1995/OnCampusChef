class DropConsultations < ActiveRecord::Migration
  def change
  	drop_table :consultations
  end
end
