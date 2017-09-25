class CommentsController < ApplicationController
  before_action :current_user
  before_action :user_from_nav

  def index
    @comments=Comment.all
    # @post = Post.find(params[:post_id])
    # @comments=@post.comments.all
    # @comments_by_post=Comment.where(params[:post_id])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment=@post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @comment=@post.comments.create(comment_params)
    if @current_user
      @comment.user_id=@current_user.id
      if @comment.save
        redirect_to post_path(@post)
      else
        flash[:alert] = "Save unsuccessful"
        render :back
      end
    else
      flash[:alert] = "Session expired"
      render root_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment=@post.comments.find(params[:id])
    if @current_user
      if @current_user.id == @comment.user_id || @current_user.id == @Post.user_id
        @comment.destroy
        redirect_to post_path(@post)
      else
        flash[:alert] = "Not authoried to delete"
        render :back
      end
    else
      flash[:alert] = "Session expired"
      render root_path
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :content)
    end
end
