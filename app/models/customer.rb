class Customer < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :teas, through: :subscriptions, dependent: :destroy

  validates_presence_of :first_name, :last_name, :email, :address
  validates_uniqueness_of :email
end
