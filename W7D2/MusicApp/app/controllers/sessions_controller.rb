class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            email: session[:email], password: session[:password])
        if @user
            log_in!(@user)
            redirect_to user_url(@user)
        else   
            render :new 
        end
    end
end
