class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  def auth_check
  	unless signed_in?
  		flash[:error] = "You need to be signed in to do that."
  		redirect_to :root
  	end
  end

end
