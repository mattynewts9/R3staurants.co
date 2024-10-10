class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :reviews

  validates :date, presence: true # Ensure a booking date is provided
end
