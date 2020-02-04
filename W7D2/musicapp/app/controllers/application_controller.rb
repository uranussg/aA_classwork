class ApplicationController < ActionController::Base
  helper_method :current_user, :log_in?
  

  def current_user
    @user = User.find_by(session_token: session[:session_token])
  end

  def log_in? 
    !!current_user
  end

  def log_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_log_in
    redirect_to new_session_url unless log_in?
  end
end
