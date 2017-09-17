class SessionsController < ApplicationController
  before_action :current_user
  before_action :user_from_nav

  def sign_in_form
  end

  def sign_in
    @user = User.find_by(username: params[:username])

    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "You have signed in successfully"
      redirect_to root_path
    else
      flash[:alert] = "Invalid username/password combination"
      redirect_to :back
    end
  end

  def sign_out_now
    redirect_to :sign_out
  end

  def sign_out
    session[:user_id] = nil
    puts "Current after sign out #{@current_user.id}"
    redirect_to root_path
  end
end
