
class UsersController < ApplicationController
  

  def new
    @user = User.new
    render :new
  end   


  def create
    debugger
    @user = User.new(user_params)
    debugger
    if @user.save
      @user.reset_session_token
      login_user!(@user)
      redirect_to user_url(@user)
    else   
      #redirect_to new_user_url
      render json: @user.errors.full_messages, status: unprocessible_entity
    end
  end


  def show
    @user = User.find(params[:id])
    render :show
  end

  def index
    @users = User.all  
    render :index
  end
  private 

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
