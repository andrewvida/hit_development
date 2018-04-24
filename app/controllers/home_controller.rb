class HomeController < ApplicationController
  layout 'poster'

  def index
    @recent_posts = Post.all.order('updated_at DESC').take(4)
  end

  def search
    @search_terms = params[:terms].split(',')
    users = User.tagged_with(:names => @search_terms, :match => :any)
    depts = Department.tagged_with(:names => @search_terms, :match => :any)
    posts = Post.tagged_with(:names => @search_terms, :match => :any)
    @results = { users: users, depts: depts, posts: posts }
  end

end