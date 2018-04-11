class Post < ApplicationRecord
  belongs_to :department
  belongs_to :user
  Gutentag::ActiveRecord.call self
end
