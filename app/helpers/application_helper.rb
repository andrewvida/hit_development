module ApplicationHelper

  def get_departments
    depts = Department.all
    depts
  end

  def get_popular_tags
    tags = Gutentag::Tag.take(20)
    tags.sort_by{|t| t[:taggings_count]}
  end
end
