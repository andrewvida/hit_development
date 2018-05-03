class Department < ApplicationRecord
  Gutentag::ActiveRecord.call self
  belongs_to :department_head, class_name: 'User'
end
