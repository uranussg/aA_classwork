class UsersController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in!(@user)
            render 
        else   
            render json: @user.errors.full_messages
        end
    end
end
