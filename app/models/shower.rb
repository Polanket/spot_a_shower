class Shower < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  validates :price, numericality: { only_integer: true }
  validates :description, :address, :features, presence: true
end
