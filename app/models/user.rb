class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true

  validates :password, length: { minimum: 6 }, :on => :create
  validates :password, length: { minimum: 6 }, :on => :update_password
  
  validate :password_equal_to_confirmation, :on => :create
  validate :password_equal_to_confirmation, :on => :update_password


  validates :savings, numericality: { greater_than_or_equal_to: 0 }

  validates :username, :uniqueness => true

  has_many :fixed_costs, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :types, dependent: :destroy

  def password_equal_to_confirmation
    errors.add(:password, 'Must equal the confirmation') unless
      self.password != self.password_confirmation
  end
end
