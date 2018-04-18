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
end
