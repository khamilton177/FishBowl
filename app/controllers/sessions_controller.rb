class SessionsController < ApplicationController
  before_action :current_user
  before_action :user_from_nav

  def sign_in_form
  end

  def sign_in
    if params[:username].present? && params[:password].present?
      user = User.find_by(username: params[:username])
      authenticated_user = user.authenticate(params[:password]) if user
    end

    if authenticated_user
      session[:user_id] = authenticated_user.id
      flash[:notice] = "You have signed in successfully."
      redirect_to root_path
    else
      flash[:alert] = "Invalid username/password combination."
      redirect_back(fallback_location: root_path)
    end
  end

  def sign_out_now
    redirect_to :sign_out
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path
  end
end
