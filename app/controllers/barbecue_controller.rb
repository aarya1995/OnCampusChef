class BarbecueController < ApplicationController
	def bbq
		@bbq = Barbecue.new
	end

	def create
	end
	
end
