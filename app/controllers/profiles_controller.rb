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
    @profile = Profile.where(params[:user_id]).first
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find(params[:user_id])
  end

  def create
    @profile=Profile.create(profile_params)
    @profile.user_id=@current_user.id
    if @profile.save
      flash[:notice] = "Saved"
      redirect_to user_path(@profile.user_id)
    else
      flash[:alert] = "Sign Up failed"
      # redirect_to edit_profile_path(@profile)
      redirect_to :back
    end
  end

  def update
    @profile = Profile.find(params[:id])
     if @profile.update(profile_params)
       flash[:notice] = "Update successful"
       redirect_to profile_path(@profile)
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
    params.require(:profile).permit(:id, :user_id, :email, :fname, :lname, :dob, :avatar, :about)
  end
end
