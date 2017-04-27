class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      password: params[:user][:password]
    )
    if @user.save
      flash[:notice] = "User created"
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
     @user.username = params[:user][:username]
     @user.password = params[:user][:password]
     if @user.save
       flash[:notice] = "Update successful"
       redirect_to user_path(@user)
     else
       flash[:alert] = "Update fialed"
       redirect_to edit_user_path(@user)
     end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Deleted successfully"
    else
      flash[:alert] = "Delete failed"
    end
    redirect_to users_path
  end
end
