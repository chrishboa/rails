class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_name(params[:name])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to users_path
		else
			render "new"
		end
	end

	def destroy
		if session[:user_id] != nil
			session[:user_id] = nil
			redirect_to league_path
		end
	end
	
end
