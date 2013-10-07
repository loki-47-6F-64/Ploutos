class Bill < ActiveRecord::Base
  belongs_to :fixed_cost

  def payed?
    return self.when_payed != nil
  end
end
