class User < ActiveRecord::Base
  has_secure_password
  has_secure_token

  validates_uniqueness_of :email
  validates_presence_of :password_digest, :email
  validates_format_of :email, with: /@/

  has_many :members
  has_many :groups, through: :members
end