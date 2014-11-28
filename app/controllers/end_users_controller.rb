class EndUsersController < ApplicationController

	def menu1
		@user = EndUser.new
	end

	def create
		@user = EndUser.new(user_params)

		respond_to do |format|
	      if @user.save
	        format.html { redirect_to @user, notice: 'Person was successfully created.' }
	        
	        # added:
	        format.js   { render action: 'show', status: :created, location: @user }
	      else
	        format.html { render action: 'new' }
	        
	        # added:
	        format.js   { render json: @user.errors, status: :unprocessable_entity }
	      end
    	end
	end

	private

	def user_params
  		params.require(:end_user).permit(:name, :phonenumber, :address, :email, :mealplan)
  	end
end
