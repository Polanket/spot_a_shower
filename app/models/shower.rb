class Shower < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :price, numericality: { only_integer: true }
  validates :description, :address, :features, presence: true

  include PgSearch
  pg_search_scope :search_by_name_and_address,
    against: [:title, :address],
    using: {
      tsearch: { prefix: true }
    }
end
