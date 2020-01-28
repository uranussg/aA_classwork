class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @user = User.find_by(session_token: session[session_token])
    end

    def log_in? 
        !!current_user
    end

    def log_in!(user)
        user.reset_session_token!
        session[session_token] = user.session_token
    end
end
