class User < ActiveRecord::Base
  validates :name, presence: true
  validates :password, length: { minimum: 6 }
  has_secure_password
  validates_confirmation_of :password, if: lambda { |m| m.password.present? }
end
