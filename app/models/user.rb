class User < ApplicationRecord
  belongs_to :department
  Gutentag::ActiveRecord.call self
end
