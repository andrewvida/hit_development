class Department < ApplicationRecord
  Gutentag::ActiveRecord.call self
  has_many :users
  has_one :department_head, -> { where(department_head: true) }, class_name: "User"
end
