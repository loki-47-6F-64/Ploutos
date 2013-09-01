class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, :on => :create
  validates :password, length: { minimum: 6 }, :on => :create 




  validates :savings, numericality: { greater_than_or_equal_to: 0 }, :on => :update

  validates :username, :uniqueness => true
  has_many :fixed_costs, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :types, dependent: :destroy
end
