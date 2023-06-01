class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  enum status: [:active, :cancelled]
  enum frequency: [:weekly, :biweekly, :monthly]
end
