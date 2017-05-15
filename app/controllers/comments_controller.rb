class CommentsController < ApplicationController
  before_action :current_user

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    puts "THIS IS CURRENT USER #{@current_user}"
  end

  def index
  end

  def create
    @post = Post.find(params[:post_id])
    @comment=@post.comments.build(comment_params)
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
      params.require(:comment).permit(:user_id, :content)
    end
end
