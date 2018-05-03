class EditPermission < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :post_type
end
