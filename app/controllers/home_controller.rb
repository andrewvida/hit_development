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

  def careers
    @job_posts = Post.where(post_type_id:5).order('updated_at DESC')
  end

  def faqs
    @faq_posts = Post.where(post_type_id:4).order('updated_at DESC')
  end

  def howtos
    @howto_posts = Post.where(post_type_id:3).order('updated_at DESC')
  end

  def linkto
    @linkto_posts = Post.where(post_type_id:7).order('updated_at DESC')
  end

  def leadership
    @managers = User.where(department_head: true).order('updated_at DESC')
  end

end