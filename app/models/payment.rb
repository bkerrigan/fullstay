class Payment < ActiveRecord::Base
  attr_accessible :amount_due, :amount_paid, :method
end
