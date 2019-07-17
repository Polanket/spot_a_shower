class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :shower

  validates :date, presence: true
  # validates :time, presence: true

  def self.time
    ['9:00 - 9:30', '9:30 - 10:00', '10:00 - 10:30', '10:30 - 11:00', '13:00 - 13:30', '13:30 - 14:00', '16:00 - 16:30', '16:30 - 17:00', '18:00 - 18:30', '19:30 - 20:00']
  end
end
