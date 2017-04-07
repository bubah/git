class ProjectsController < ApplicationController
	before_action :require_user, only: [:new, :create, :edit, :update, :destroy ]
	before_action :require_editor, only: [:new, :create, :edit, :update, :destroy]
	before_action :require_admin, :require_editor, only: [:new, :create, :edit, :update, :destroy]

	def index
		@projects = Project.all
	end

	def home
	end

	def about
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			flash[:success] = "#{@project.title} has been uplaoded"
			redirect_to '/'
		else
			flash[:error] = "uplaod unsuccessful please make sure file has valid extension"
			render 'new'
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			flash[:success] = "#{@project.title} has been updated"
			redirect_to(:action => 'index')
		else
			flash[:error] = "Update unsuccessful please make sure your file has valid extension"
			render 'edit'
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		flash[:success] = "#{@project.title} has been deleted"
		redirect_to(:action => 'index')
	end

private
	def project_params
		params.require(:project).permit(:title, :description, :image)
	end
end
