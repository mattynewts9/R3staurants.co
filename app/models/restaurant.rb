class Restaurant < ApplicationRecord
  validates :name, :description, :image_url, presence: true
  validates :image_url, uniqueness: true
  validates :category, presence: true
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
end
