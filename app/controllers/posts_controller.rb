class PostsController < ApplicationController
  before_action :current_user

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Saved"
      redirect_to post_path(@post)
    else
      render "new"
    end
  end

  def update
    @post = Post.find(params[:id])
     if @post.update(post_params)
       flash[:notice] = "Update successful"
       redirect_to post_path(@post)
     else
       flash[:alert] = "Update failed"
       render "edit"
     end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Deleted successfully"
    else
      flash[:alert] = "Delete failed"
    end
      redirect_to posts_path
  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user=User.find(1)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
