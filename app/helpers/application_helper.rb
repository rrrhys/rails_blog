module ApplicationHelper
	def sign_in(user)
		#save the remember token in the cookie
		cookies.permanent[:remember_token] = user.remember_token
		logger.debug "User #{user.name}"
		logger.debug "Storing token #{user.remember_token}"
		self.current_user = user
	end
	def signed_in?
		#return true if current user not nil
		!current_user.nil?
	end
	def current_user=(user)
		@current_user = user
	end

	def current_user
		#if current_user is nil, lookup by remember token in cookie.
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end
end
