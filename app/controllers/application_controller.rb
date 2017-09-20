class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  helper_method :current_user
  helper_method :user_from_nav

  private
    def current_user
      if session[:user_id]
        @current_user = User.find(session[:user_id])
      end
    end

    # Allows user model forms on navigation bar to render from any controller/view
    def user_from_nav
      if current_user
        @user = current_user
      end
    end

end
