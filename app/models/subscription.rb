class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates_presence_of :title, :status, :frequency
  validates_presence_of :price, numericality: { greater_than: 0 }
  
  enum status: [:active, :inactive]
  enum frequency: [:weekly, :biweekly, :monthly]
end
