class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :owned_showers, class_name: 'Shower'
  has_many :booked_showers, through: :bookings, source: :shower

  validates :first_name, presence: true
  validates :last_name, presence: true
end
