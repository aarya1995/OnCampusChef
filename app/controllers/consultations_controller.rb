class ConsultationsController < ApplicationController

	def new
		@user = Consultation.new
	end

	def create
		@user = Consultation.new(user_params)
			
		respond_to do |format|
	      if @user.save
	      	flash[:success] = "submitted!"
        	format.html { redirect_to new_consultation_path(@user) }
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
  		params.require(:consultation).permit(:name, :phone, :address, :email)
  	end
end
