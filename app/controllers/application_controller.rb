class ApplicationController < ActionController::Base

    before_action :authorized


    helper_method :logged_in?


    def set_current_user
        @current_user = User.find_by(id: session[:user])
    end

    def logged_in?
        # This method returns a boolean, depending on if there's a user logged in or not
        !!set_current_user
    end

    def authorized
        redirect_to new_user_path unless logged_in?
    end

end
