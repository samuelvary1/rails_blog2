class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # helper :all

  # protect_from_forgery with: :exception

  helper_method :current_user
  
  protected

  def current_user_session
  	return @current_user_session if defined?(@current_user_session)
  	@current_user_session = UserSession.find
  end

  def curent_user
  	return @current_user if defined?(@current_user)
  	@current_user = current_user_session && current_user_session.record
  end

  def validate_user
  	# unless current_user means "unless @current_user == true"
  	unless current_user
  		flash[:notice] = "Must be a registered user!"
  		redirect_to :log_in
  	end
  end
end
