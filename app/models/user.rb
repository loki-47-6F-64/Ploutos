class User < ActiveRecord::Base
  has_secure_password

  validates :username, :password, :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }, :on => :create 

  has_many :fixed_costs, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :types, dependent: :destroy
end
