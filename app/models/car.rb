class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  belongs_to_many :users, through: :bookings
  validates :model, :price, :seat_number, presence: true
end
