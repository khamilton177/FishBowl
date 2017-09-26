# posts=[]
# users=User.all
# users.each do |user|
#   if user.posts.last
#     posts << user.posts.last
#   end
# end
# @posts=posts.sort_by {|post| post.id}.reverse
#
# @posts.each do |p|
#     puts p.title
# end

# class User < ApplicationRecord
#   has_one :profile, dependent: :destroy
#   has_many :posts, dependent: :destroy
#
#   scope :admin, -> {where(:admin, true)}
#   before_save { self.username = self.username.to_s.downcase }
#   scope :latest_post, -> order(created_at: :desc).last
#
# end
#
# utest=User.find(4)
# puts utest.admin
# # puts utest.posts.last.id
# puts utest.posts.latest_post

posts = Post.order('updated_at DESC').all

posts.each do |post|
  if post.user.posts.last
    puts post.user.posts.last.title
  end
end
