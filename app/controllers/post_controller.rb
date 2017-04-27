class PostController < ApplicationController

  # 
  def index
    @posts=Post.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def new
    @posts=Post.all
  end

  def edit
    @posts=Post.all
  end

  def create
    @posts=Post.all
  end

  def update
    @posts=Post.all
  end

  def destroy
    @posts=Post.all
  end

end
