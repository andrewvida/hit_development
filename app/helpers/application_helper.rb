module ApplicationHelper

  def get_departments
    depts = Department.all
    depts
  end

  def get_popular_tags
    tags = Gutentag::Tag.take(20)
    tags.sort_by{|t| t[:taggings_count]}
  end

  def all_tags
    tags = Gutentag::Tag.all
    tags
  end

  def new_announcement_count
    announcements = Post.where(post_type: 1).count
  end

  def current_user
    User.all.sample
  end

  def tags_by_department
    tags = []
    if params[:controller] === 'users' && !params[:id].nil?
      tags = User.find(params[:id]).tags
    elsif params[:controller] === 'departments' && !params[:id].nil?
      tags = Department.find(params[:id]).tags
    elsif params[:controller] === 'posts' && !params[:id].nil?
      tags = Post.find(params[:id]).tags
    else
      tags = []
    end
  end
end
