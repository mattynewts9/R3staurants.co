class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :user, presence: true  # Ensure a user is associated with the booking
  validates :restaurant, presence: true  # Ensure a restaurant is associated with the booking
  validates :booking_date, presence: true  # Ensure a booking date is provided
  validates :booking_time, presence: true  # Ensure a booking time is provided
  validates :number_of_guests, presence: true, numericality: { only_integer: true, greater_than: 0 }  # Ensure a valid number of guests

  validate :booking_date_cannot_be_in_the_past  # Booking has to be in future

  private
  def booking_date_cannot_be_in_the_past
    if booking_date.present? && booking_date < Date.today
      errors.add(:booking_date, "can't be in the past")
    end
  end
end
