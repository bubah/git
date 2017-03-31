class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			if @user.email_confirmed
			session[:user_id] = @user.id
        	redirect_to '/home'
      		else
        	flash.now[:error] = 'Please activate your account by following the 
        	instructions in the account confirmation email you received to proceed'
        	render 'new'
      		end
 
		else
			flash.now[:error] = 'Invalid email/password combination'
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have been successfuly loged out"
		redirect_to ''
	end

	
end
