class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  enum status: [:active, :inactive]
  enum frequency: [:weekly, :biweekly, :monthly]
end
