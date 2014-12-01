class Consultation < ActiveRecord::Base
	validates_presence_of :name, :phone, :address, :email
end
