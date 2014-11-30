class PotUsersController < ApplicationController
	

	def new
		@user = PotUser.new
	end

	def create
		@user = PotUser.new(user_params)
			
		respond_to do |format|
	      if @user.save
	      	flash[:success] = "submitted!"
        	format.html { redirect_to new_pot_user_path(@user) }
        	format.js
	      else
	        format.html { render action: 'new' }
	        
	        # added:
	        format.js   { render json: @user.errors, status: :unprocessable_entity }
	      end
    	end
	end

	private

	def user_params
  		params.require(:pot_user).permit(:name, :phone, :address, :email, :basicinfo)
  	end
end
