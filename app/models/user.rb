class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_secure_password
  after_destroy :ensure_an_admin_remains
end
