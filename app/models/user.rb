class User < ApplicationRecord
  belongs_to :department
  acts_as_taggable_on :keywords
end
