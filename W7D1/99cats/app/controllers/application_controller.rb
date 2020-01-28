class ApplicationController < ActionController::Base
  helper_method :current_user, :log_in?
  before_action :log_in_redirect, only: [:new, :create]
  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def log_in?
    !!current_user
  end 

  def login_user!(user)
    session[:session_token] = user.session_token
  end

  def log_in_redirect
    redirect_to cats_url if log_in?
  end

end
