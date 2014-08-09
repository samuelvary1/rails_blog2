class UserSessionsController < ApplicationController
  def new
  	@user_session = UserSession.new
  end

  def create
  	@user_session = UserSession.new(params[:user_session])
  	if @user_session.save
  		flash[:notice] = "Successfully logged in."
  		redirect_to root_url
  	else
  		render :action => 'new'
  	end
  end

	def destroy
  	user_session[:user_id] = nil
  	redirect_to root_url, :notice => "Logged out!"
	end
end
