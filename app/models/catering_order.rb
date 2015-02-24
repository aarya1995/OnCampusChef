class CateringOrder < ActiveRecord::Base

	validates :name, presence: true
	validates :email, presence: true
	validates :phone, presence: true
	validates :availability, presence: true
	validates :address, presence: true
	validates :organization, presence: true
end
