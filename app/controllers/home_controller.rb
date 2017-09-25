class HomeController < ApplicationController
  before_action :current_user
  before_action :user_from_nav

  def index
    posts=[]
    users=User.all
    users.each do |user|

      # Only want to capture users with post and ONLY last post.
      if user.posts.last
        posts << user.posts.last
      end
    end

    # Sorting post by id on array in DESC order.
    @posts=posts.sort_by {|post| post.id}.reverse
  end

end
