class ProfilesController < ApplicationController
  before_action :current_user
  before_action :user_authenticated, except: [:new, :create]
  before_action :user_from_nav
  before_action :find_profile_for_avatar, only: [:upload_avatar, :remove_avatar]

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    # @profile = Profile.where(user_id: params[:user_id]).first
    # @user=User.find(@profile.user_id)
  end

  def new
    @profile = Profile.new
  end

  def create
    # puts params.inspect
    @profile=Profile.new(profile_params)
    @profile.user_id=current_user.id
    if @profile.save
      flash[:notice] = "Saved"
      redirect_to user_path(@profile.user_id)
    else
      flash[:alert] = "save failed"
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    if @profile.save
      flash[:notice] = "Update successful"
      redirect_to user_path(@profile.user_id)
    else
      flash[:alert] = "Update failed"
      redirect_to edit_profile_path(@profile)
    end
  end

  def upload_avatar
    # @profile = Profile.find_by(user_id: params[:user_id])
    @profile.update(@profile.avatar)
    if @profile.save
      flash[:notice] = "Update successful"
      redirect_to user_path(@profile.user_id)
    else
      flash[:alert] = "Update failed"
      redirect_to edit_profile_path(@profile)
    end
  end

  def remove_avatar
    # @profile = Profile.find_by(user_id: params[:user_id])
    @profile.avatar = nil
    @profile.save
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

  def user_authenticated
    logger.debug ("*** Checking Authenticated User STATUS ***")
    unless session[:user_id]
      flash[:notice] = "Please login."
      redirect_to root_path
    end

    if current_user && current_user.profile.id.to_s != params[:id].to_s
      flash[:alert] = "You do not have access to the requested page."
      redirect_back(fallback_location: root_path)
    end
  end

  def find_profile_for_avatar
    # prev = Rails.application.routes.recognize_path(request.referrer)
    # prev[:controller]
    puts "***  THIS WAS PASSED #{params.inspect} ***"
    identifier = params[:user_id].present? ? "user_id:" : "id:"
    @profile = Profile.find_by(identifier params[:id])
  end

  def profile_params
    params.require(:profile).permit(:email, :fname, :lname, :dob, :avatar, :about, :user_id)
  end
end
