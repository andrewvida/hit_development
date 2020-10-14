module ApplicationHelper

  def get_announcements
    [ Post.where(post_type_id: 1).last ]
  end

  def get_bulletins(department_id=nil)
    Post.where(post_type_id: 2, department_id:department_id)
  end

  def get_departments
    depts = Department.all
    depts
  end

  def get_popular_tags
    tags = Gutentag::Tag.take(20)
    tags.sort_by{|t| t[:taggings_count]}
  end

  def get_post_types
    PostType.all
  end

  def all_tags
    tags = Gutentag::Tag.all
    tags
  end

  def current_user
    User.all.sample
  end

  def current_user_post_permission(user)
    permission = EditPermission.where(user: user)

    available_departments = []
    available_post_types = []

    permission.each do |perms|
      available_departments << Department.find(perms.department_id)
      available_post_types << PostType.find(perms.post_type_id)
    end

    result = {
      available_departments: available_departments.uniq.flatten,
      available_post_types: available_post_types.uniq.flatten,
      current_user: user }

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

  def format_youtube_video_for_embed(video_url)
    yt = Rack::Utils.parse_query URI(video_url).query
    yt['v']
  end
end
