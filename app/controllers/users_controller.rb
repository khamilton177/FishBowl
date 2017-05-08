class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_profile
    # @profile=Profile.new
  end

  def edit
    @user = User.find(params[:id])
    @user.build_profile
    # @profile = Profile.find(params[:user_id])
  end

  def create
    @user = User.new(user_params)
    # @profile =Profile.new(fname: params[:fname], lname: params[:lname], dob: params[:dob], about:params[:about], user_id: @user.id)
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
     if @user.update(user_params)
       flash[:notice] = "Update successful"
       redirect_to user_path(@user)
     else
       flash[:alert] = "Update failed"
       redirect_to edit_user_path(@user)
     end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Deleted successfully"
      redirect_to users_path
    else
      flash[:alert] = "Delete failed"
      render :edit
    end
  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user=User.find(1)
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email, profile_attributes: [:id, :user_id, :fname, :lname, :dob, :avatar, :about, :_destroy])
  end
end
