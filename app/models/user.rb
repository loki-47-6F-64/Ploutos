class User < ActiveRecord::Base
  #attr_accessor :password, :password_confirmation
  has_secure_password

  validates :username, :password, :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }, :on => :create 
end
