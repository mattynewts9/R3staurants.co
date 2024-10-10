class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :start_date, presence: true # Ensure a booking date is provided
  validates :end_date, presence: true # Ensure a booking time is provided

end
