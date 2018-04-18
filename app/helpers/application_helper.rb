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
    result = []
    tags.each do |tag|
      result << {id: tag.id.to_s, text:tag.name}
    end
    result
  end
end
