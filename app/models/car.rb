class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :model, :price, :seat_number, presence: true
end
