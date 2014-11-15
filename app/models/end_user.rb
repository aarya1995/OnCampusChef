class EndUser < ActiveRecord::Base

	validates_presence_of :name, :phonenumber, :address, :email, :mealplan
end
