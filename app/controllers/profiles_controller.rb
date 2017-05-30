class ProfilesController < ApplicationController
  before_action :current_user

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.where(user_id: params[:user_id]).first
    @user=User.find(@profile.user_id)
  end

  def new
    @profile = Profile.new
  end

  def create
    puts params.inspect
    puts "Current USer- #{@current_user.id}"
    @profile=Profile.new(profile_params)
    @profile.user_id=@current_user.id
    if @profile.save
      flash[:notice] = "Saved"
      redirect_to user_path(@profile.user_id)
    else
      flash[:alert] = "save failed"
      render :new
    end
  end

  def edit
    @profile = Profile.where(params[:user_id]).first
  end

  def update
    @profile = Profile.where(params[:user_id]).first
    @profile.update(profile_params)
    if @profile.save
      flash[:notice] = "Update successful"
      redirect_to user_path(@profile.user_id)
    else
      flash[:alert] = "Update failed"
      redirect_to edit_profile_path(@profile)
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    if @profile.destroy
      flash[:notice] = "Deleted successfully"
    else
      flash[:alert] = "Delete failed"
    end
    redirect_to profiles_path
  end

  private
  def profile_params
    params.require(:profile).permit(:email, :fname, :lname, :dob, :avatar, :about, :user_id)
  end
end
