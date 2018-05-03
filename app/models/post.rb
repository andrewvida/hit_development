class Post < ApplicationRecord
  belongs_to :department
  belongs_to :author, class_name: 'User'
  Gutentag::ActiveRecord.call self
end
