class HomeController < ApplicationController
  before_action :current_user

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def index
    @users=User.all
    @posts=Post.all
  end

  # def "sign-in"
  # end
end
