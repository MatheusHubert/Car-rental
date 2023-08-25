class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :start_date, :end_date, presence: true
  validates :start_date, :end_date, uniqueness: true
  validate :end_date_after_start_date
  validates :start_date, :end_date, overlap: { scope: 'car_id',
                                               message_content: 'overlaps with this cars other bookings.' }

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
