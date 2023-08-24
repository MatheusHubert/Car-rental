class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many_attached :photos
  validates :model, :price, :seat_number, :description, :address, :photos, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search,
                  against: %i[model price seat_number address description],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
