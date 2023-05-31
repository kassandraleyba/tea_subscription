class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :teas
end
