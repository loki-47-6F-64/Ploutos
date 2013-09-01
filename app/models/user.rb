class User < ActiveRecord::Base
  has_secure_password

  validates :username, :password, :password_confirmation, presence: true, :on => :create
  validates :password, length: { minimum: 6 }, :on => :create 


  validates :password, :password_confirmation, :old_password, presence: true, :on => :update_password

  validates :username, :uniqueness => true
  has_many :fixed_costs, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :types, dependent: :destroy
end
