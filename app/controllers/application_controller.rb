class ApplicationController < ActionController::Base
    before_action :fetch_user #call this before any other action is called 

    private 
    def fetch_user
        @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
        session[:user_id] = nil unless @current_user.present?
    end

    def check_for_login
        redirect_to login_path unless @current_user.present? #allows controller functions to check if a user is logged in, ie attempting to go to the create folder page without being logged in. Add as 'before_action :check for login' in any controller that should only be logged in to use
    end

    def check_for_admin
        redirect_to root_path unless @current_user.present? && @current_user.admin
    end
end
