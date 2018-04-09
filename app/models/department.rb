class Department < ApplicationRecord
  acts_as_taggable_on :keywords
end
