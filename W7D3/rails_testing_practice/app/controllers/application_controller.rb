class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?, :log_in!

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
  
  def logged_in?
    !!current_user
  end

  def log_in!(user)
    session[:session_token] = user.reset_session_token!
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_log_in
    render new_user_url unless logged_in?
  end
end
