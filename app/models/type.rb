class Type < ActiveRecord::Base
  has_many :fixed_costs, :dependent => :delete_all
  validates :name, presence: true
end
