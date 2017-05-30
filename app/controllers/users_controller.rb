class UsersController < ApplicationController
  before_action :current_user

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile = Profile.where(user_id: params[:id]).first
  end

  def my_post
    @posts=Post.where(params[:user_id])
  end

  def new
    puts params.inspect
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    puts params.inspect
    @user = User.create(user_params)

    if @user.save
      session[:user_id]=@user.id
      flash[:notice] = "User created"
      redirect_to new_profile_path
    else
      flash[:alert] = "Sign-Up failed"
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:notice] = "Update successful"
       redirect_to user_path(@user)
     else
       flash[:alert] = "Update failed"
       render :edit
     end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      flash[:notice] = "Deleted successfully"
      redirect_to root_path
    else
      flash[:alert] = "Delete failed"
      render :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
