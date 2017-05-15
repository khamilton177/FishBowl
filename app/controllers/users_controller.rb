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
  end

  def new
    puts params.inspect
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    # redirect_to profiles_path
    @profile = User.profile.build(profile_params)
    # @comment.user_id=@current_user.id
    @user.profile = @user.id

    if @user.save
      session[:user_id]=@user.id
      flash[:notice] = "User created"
      redirect_to root_path
    else
      flash[:alert] = "Sign-Up failed"
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    # @user.build_profile
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
      flash[:notice] = "Deleted successfully"
      redirect_to users_path
    else
      flash[:alert] = "Delete failed"
      render :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email, profile_attributes: [:id, :user_id, :fname, :lname, :dob, :avatar, :about, :_destroy])
  end
end
