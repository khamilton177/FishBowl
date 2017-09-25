@posts=[]
@users=User.all
@users.each do |user|
  if user.posts.last
    @posts << user.posts.last
  end
end
@posts.sort_by {|post| post.id}.reverse.each do |p|
    puts p.title
  end
