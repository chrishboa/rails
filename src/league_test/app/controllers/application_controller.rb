class ApplicationController < ActionController::Base
  protect_from_forgery
	

	private
		def current_user
			if session[:user_id]
				@current_user ||= User.find(session[:user_id])
			end
		end
		def user_signed_in?
			current_user.present?
		end
		
		helper_method :user_signed_in?

		def require_login
			unless user_signed_in?
				redirect_to login_path,
			alert: "Bitte melden Sie sich zuerst an."
		end
end
end
