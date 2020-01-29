class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    #fail
    @user = User.find_by_credentials(params[:session][:email], params[:session][:password])
    #debugger
    if @user
      
      log_in!(@user)
      redirect_to user_url(@user)
    else   
      render :new 
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def session_params
    session.require
  end
end
