class Post < ApplicationRecord
  belongs_to :department
  belongs_to :user
  acts_as_taggable_on :keywords
end
