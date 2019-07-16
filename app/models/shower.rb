class Shower < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  validates :price, numericality: { only_integer: true }
  validates :description, :address, :features, :availability, presence: true
end
