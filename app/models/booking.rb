class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :shower

  validates :price, numericality: { only_integer: true }
  validates :date, presence: true
  validates :time, presence: true
end
