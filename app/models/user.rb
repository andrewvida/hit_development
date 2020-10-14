class User < ApplicationRecord
  # devise :saml_authenticatable, :trackable
  belongs_to :department
  Gutentag::ActiveRecord.call self

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
