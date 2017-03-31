class UsersController < ApplicationController
before_action :require_admin, only: [:index, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			ApplicationMailer.registration_confirmation(@user).deliver
        	flash[:success] = "A link has been sent to your email address please click link to confirm"

			redirect_to '/login'
		else
			flash[:error] = "Ooooppss, something went wrong!"
			redirect_to '/signup'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "#{@user.first_name} #{@user.last_name} account has been updated"
			redirect_to(:action => 'index')
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:success] = "#{@user.first_name} #{@user.last_name} account has been deleted"
		redirect_to(:action => 'index')
	end

	def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to Bubah's Porfolio page! Your email has been confirmed.
      Please sign in to continue."
      redirect_to '/login'
    else
      flash[:error] = "Sorry. User does not exist please signup again"
      redirect_to root_url
    end
end
	
private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :role, :email_confirmed)
	end

end
