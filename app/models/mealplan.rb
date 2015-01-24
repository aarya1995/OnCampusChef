class Mealplan < ActiveRecord::Base
	has_many :orders
end
