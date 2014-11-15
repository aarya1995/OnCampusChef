class EndUsersController < ApplicationController

	def new
		@user = EndUser.new
	end

	def create
		@user = EndUser.new(user_params)
		if @user.save
			redirect_to '/testudo'
		else 
			render 'new'
		end
	end

	private

	def user_params
  		params.require(:end_user).permit(:name, :phonenumber, :address, :email, :mealplan)
  	end
end
