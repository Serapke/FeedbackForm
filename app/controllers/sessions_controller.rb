class SessionsController < ApplicationController
	def new
	end

  def destroy
    #@session = Session.find(params[:admin_id])
    #@session.destroy
		session[:admin_id] = nil
		session[:user_id] = nil
		redirect_to root_path
	end

	def create
		@admin = Admin.find_by_username(params[:session][:username])
		@user = User.find_by_name(params[:session][:username])
		if @admin || @user
			if @admin && @admin.authenticate(params[:session][:password])
				session[:admin_id] = @admin.id
				redirect_to comments_path
			elsif @user && @user.authenticate(params[:session][:password])
				session[:user_id] = @user.id
				redirect_to root_path
			else
				flash.now.alert = "Invalid password"
				redirect_to(:back)
			end
		else
			flash.now.alert = "Invalid username or password"
			redirect_to(:back)
		end
	end
end
