class EndUser < ActiveRecord::Base

	validates :name, presence: true
	validates :phonenumber, presence: true
	validates :address, presence: true
	validates :email, presence: true
	validates :mealplan, presence: true
	validates :plan, presence: true

	#validates_presence_of :name, :phonenumber, :address, :email, :mealplan
end
