class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to user_url(user)
    else
      redirect_to new_session_url
      #could also put render json: user.errors.full_messages, status: 418
    end 
  end    

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url

  end 

end
