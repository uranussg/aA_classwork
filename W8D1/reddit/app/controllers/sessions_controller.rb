class SessionsController < ApplicationController

  before_action :require_logged_in, only: [:destroy]


  def new 
    render :new
  end

  def create 
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user 
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid username or password"]
      render :new 
    end
  end

  def destroy 
    log_out
  end

end
