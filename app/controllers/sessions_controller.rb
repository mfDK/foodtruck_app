class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id 
			redirect_to user_path(current_user)
			# This will be changed to current_user once
			# current_user helper method is implemented
		else
			flash[:alert] = "Invalid Username or Password"
			redirect_to root_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
