class HomeController < ApplicationController
  before_action :current_user
  before_action :user_from_nav

  def index
    @users=User.all
    @posts=Post.all
  end

private

  # def user_latest_post
  #
  #   posts=Post.all
  #   User.find_each do |user|
  #     @posts=posts.where(user_id: user).last
  #   end
  # end

end
