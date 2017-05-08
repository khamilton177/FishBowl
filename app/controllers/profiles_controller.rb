class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find(params[:user_id])
  end

  def create
    @profile=Profile.create(profile_params)
    if @profile.save
      flash[:notice] = "Saved"
      redirect_to user_path(@profile.user_id)
    else
      flash[:alert] = "Profile Creation Failed"
      # redirect_to edit_profile_path(@profile)
      redirect_to root_path
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

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user=User.find(1)
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:fname, :lname, :dob, :avatar, :about, :user_id)
  end
end
