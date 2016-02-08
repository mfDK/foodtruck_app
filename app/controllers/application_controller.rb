class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
  helper_method :logged_in?
  # This helper method was taken from the 
  # Michael Hartl book.
  # This helper_method is used to check if a user is logged
  # in and a session exists

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
		!current_user.nil?
	end

end
