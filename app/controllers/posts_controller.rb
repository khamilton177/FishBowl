class PostsController < ApplicationController
  before_action :current_user
  before_action :user_from_nav

  def index
    @posts = Post.order('created_at DESC').all
  end
  #
  # def my_post
  #   @posts=Post.where(user_id: params[:user_id])
  # end

  def posts_by_author
    @posts=Post.where(user_id: params[:user_id]).reverse
    @author = current_user && current_user.id.to_s == params[:user_id] ? "My Posts" : "#{User.find(params[:user_id]).username.capitalize}'s Posts"
  end

  def show
    @post=Post.find(params[:id])
    # @comments_by_post=Comment.where(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    puts params.inspect
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
      redirect_to posts_path(@post)
  end

  private

  # def generate_class
  #   comments-css= [
  #       "shade",
  #       "no-shade",
  #     ];
  #
  #   comments-element=[]
  #   cnt=Flavor.all.length
  #   comments-css.cycle(cnt) do |c|
  #     comments-element.push(c)
  #     @cnt=1
  #   end
  # end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
