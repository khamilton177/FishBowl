class HomeController < ApplicationController
  def index
    @users=User.all
    @posts=Post.all
  end

  # def "sign-in"
  # end
end
