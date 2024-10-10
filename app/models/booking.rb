class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :date, presence: true # Ensure a booking date is provided

end
