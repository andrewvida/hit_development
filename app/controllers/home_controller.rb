class HomeController < ApplicationController
  def index
    users = User.tagged_with(:names => ['projects', 'dealerships'], :match => :any)
    depts = Department.tagged_with(:names => ['projects', 'dealerships'], :match => :any)
    posts = Post.tagged_with(:names => ['projects', 'dealerships'], :match => :any)

    @results = { users: users, depts: depts, posts: posts }
  end
end
