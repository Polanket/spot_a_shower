class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :shower

  validates :date, presence: true
  validates :time, presence: true
end
