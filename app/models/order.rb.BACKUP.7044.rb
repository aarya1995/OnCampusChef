class Order < ActiveRecord::Base

<<<<<<< HEAD
	belongs_to :customer

	serialize :food_items, Array
=======
	belongs_to :customer	
>>>>>>> a3c5dcd2b387b2149494df665d120240d520931d

end
