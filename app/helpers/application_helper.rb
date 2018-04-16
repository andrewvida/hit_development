module ApplicationHelper

  def get_departments
    depts = Department.all
    depts
  end
end
