class PotUser < ActiveRecord::Base
	validates_presence_of :name, :phone, :address, :email, :basicinfo
end
